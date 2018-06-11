package net.utils {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.consts.StaticConfig;

import utils.Endian;

/**
 * @author hokenny
 */
public class BytesUtil {
    public static function readUserId(bytes:ByteArray):BigInteger {
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        return BytesUtil.readUint64(idBytes);
    }

    public static function readUserName(bytes:ByteArray):String {
        var heroName:String = bytes.readUTF();
        var num:int = 0;
        var serverId:int;
        var index:int = heroName.length - 1;
        if (index > 0) {
            serverId = heroName.charCodeAt(index);
            if (serverId < 32 && serverId > 0) {
                num = (num * 31 + serverId - 1);
                index--;
            }
            else {
                return heroName;
            }
            while (index > 0) {
                serverId = heroName.charCodeAt(index);
                if (serverId < 32 && serverId > 0) {
                    num = (num * 31 + serverId - 1);
                    index--;
                }
                else
                    break;
            }
            num++;
            if (num != Number(StaticConfig.serverId))
                return heroName.substr(0, index + 1) + ".S" + num.toString();
            else
                return heroName.substr(0, index + 1);
        }
        return heroName;
    }

    public static function writeUserName(str:String, bytes:ByteArray):void {
        var pos1:int = str.lastIndexOf(".S");
        var pos2:int = str.lastIndexOf(".s");
        var lastPos:int = Math.max(pos1, pos2);
        var server:String;
        if (lastPos == -1) {
            bytes.writeUTF(str);
            return;
        }
        server = str.substr(lastPos + 2, str.length);

        if (server == StaticConfig.serverId) {
            bytes.writeUTF(str);
            return;
        }
        var serverId:int = Number(server);
        if (serverId == 0) {
            bytes.writeUTF(str);
            return;
        }
        --serverId;
        var addStr:String = "";
        do
        {
            addStr += String.fromCharCode((serverId % 31) + 1);
            serverId /= 31;
        } while (serverId > 0);
        var name:String = str.substr(0, lastPos);
        bytes.writeUTF(name + addStr);
    }

    /**
     * 读取单字节
     * @param bytes
     * @return
     *
     */
    public static function readByte1(bytes:ByteArray):int {
        return bytes.readByte() & 0xFF;
    }

    /**
     * 读取双字节
     * @param bytes
     * @return
     *
     */
    public static function readByte2(bytes:ByteArray):int {
        return bytes.readUnsignedShort() & 0xFFFF;
    }

    /**读取32位无符号*/
    public static function readByte4(bytes:ByteArray):int {
        return bytes.readUnsignedInt();
    }

    /**
     * 读取8字节
     * @param bytes
     * @return
     *
     */
    public static function readBytes8(bytes:ByteArray):Number {
        var n:Number = bytes.readUnsignedInt();
        n += Math.abs((bytes.readUnsignedInt() << 20) * 0x1000);
        return n;
    }

    /**
     * 写8字节
     * @param bytes
     * @param n
     * @return
     *
     */
    public static function writeBytes8(bytes:ByteArray, n:Number):ByteArray {
        bytes.writeUnsignedInt(n);
        bytes.writeUnsignedInt(n >> 8);
        return bytes;
    }

    public static function readUint64(bytes:ByteArray):BigInteger {
        return new BigInteger(bytes2String(bytes), 16);

    }

    public static function bytes2String(array:ByteArray):String {
        var s:String = "";
        for (var i:int = array.length - 1; i >= 0; i--) {
            s += ("0" + array._byteAt_(i).toString(16)).substr(-2, 2);
        }
        return s;
    }

    public static function writeUint64(bytes:ByteArray, value:BigInteger):void {
//			if(Number(StaticConfig.serverId)>0)
//				value = value.add(BigInteger.nbv(int(StaticConfig.serverId)).shiftLeft(48));
        var tmpBytes:ByteArray = creatByteArray();
        var valuebytes:ByteArray = value.toByteArray();
        trace("@int64 :1 ", bytes2String(valuebytes));
        for (var i:int = valuebytes.length - 1; i >= 0; i--) {
            tmpBytes.writeBytes(valuebytes, i, 1);
        }
        for (var j:uint = 0; j < 8 - valuebytes.length; j++) {
            tmpBytes.writeByte(0);
        }
        //trace("@int64 :2 ", bytes2String(tmpBytes));
        bytes.writeBytes(tmpBytes, 0, 8);
    }

    public static function creatByteArray():ByteArray {
        var ba:ByteArray = new ByteArray();
        ba.endian = Endian.LITTLE_ENDIAN;
        return ba;
    }

    /**
     * 将字节数组转换成整形数组
     * @param bytes
     * @return
     */
    public static function readIntArray(bytes:ByteArray):Array {
        var array:Array = [];
        for (var i:int = 0, len:int = bytes.bytesAvailable; i < len; i++) {
            array.push(bytes.readUnsignedByte());
        }
        return array;
    }

    /*写入64位*/
    public static function writeBigInt(bigInt:Number, b:ByteArray):void {
        const zeros:String = "0000000000000000";
        var bytes:ByteArray = new ByteArray();
        bytes.endian = Endian.LITTLE_ENDIAN;
        var str:String = bigInt.toString(16);
        if (str.length > 8) {
            str = zeros.substr(0, 16 - str.length) + str
            str = parseStr(str);
        } else {
            str = zeros.substr(0, 8 - str.length) + str + "00000000";
        }
        bytes.writeUnsignedInt(parseInt(str.substr(0, 8), 16))
        bytes.writeUnsignedInt(parseInt(str.substr(8, 8), 16))
        bytes.position = 0;
        b.writeBytes(bytes);
    }

    /*读取64位*/
    public static function readBigInt(bytes:ByteArray):Number {
        const zeros:String = "00000000";
        var s:String = bytes.readUnsignedInt().toString(16);
        var str:String = zeros.substr(0, 8 - s.length) + s;
        s = bytes.readUnsignedInt().toString(16);
        str = zeros.substr(0, 8 - s.length) + s + str;
        return Number(parseInt(str, 16).toString());
    }

    private static function parseStr(str:String):String {
        var s1:String = str.substr(0, 8);
        var s2:String = str.substr(8, 8);
        return s2 + s1;

    }
}
}
