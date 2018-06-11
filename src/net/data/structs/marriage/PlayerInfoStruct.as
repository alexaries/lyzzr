package net.data.structs.marriage {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.utils.BytesUtil;

public class PlayerInfoStruct {

    public var id:BigInteger;
    public var name:String;
    public var prof:uint;
    public var sex:uint;
    public var color:uint;
    public var copyId:uint;

    public function PlayerInfoStruct() {
    }

    public static function read(bytes:ByteArray, v:PlayerInfoStruct):PlayerInfoStruct {
        var idBytes:ByteArray;
        idBytes = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        v.id = BytesUtil.readUint64(idBytes);
        v.name = BytesUtil.readUserName(bytes);
        v.prof = bytes.readByte();
        v.sex = bytes.readByte()
        v.color = bytes.readByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:PlayerInfoStruct):ByteArray {
        BytesUtil.writeUint64(bytes, v.id);
        BytesUtil.writeUserName(v.name, bytes);
        bytes.writeByte(v.prof);
        bytes.writeByte(v.sex);
        bytes.writeByte(v.color);
        return bytes;
    }
}
}