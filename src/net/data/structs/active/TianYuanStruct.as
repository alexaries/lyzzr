/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-3-6
 * Time: 下午2:21
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.utils.BytesUtil;

public class TianYuanStruct {
    public var type:uint;
    public var exp1:uint;//成长值
    public var exp2:uint;//贡献值
    public var exp3:uint;//帮派贡献值
    public var award:uint;//每日奖励状态
    public var countList:Array = [];
    public var memberList:Array = [];
    public var list1:Array = [];
    public var list2:Array = [];
    public var list3:Array = [];
    public var rankValue1:uint;
    public var rankValue2:uint;
    public var rankValue3:uint;
    public var rank1:uint;
    public var rank2:uint;
    public var rank3:uint;

    public var topGift_type:int = 0;

    public function TianYuanStruct() {
    }

    public static function read(bytes:ByteArray):TianYuanStruct {
        var struct:TianYuanStruct = new TianYuanStruct;
        var i:uint;
        var count:uint;
        var arr:Array;
        struct.type = BytesUtil.readByte1(bytes);
        switch (struct.type) {
            case 0x00:
                struct.exp1 = bytes.readUnsignedInt();
                struct.exp2 = bytes.readUnsignedInt();
                struct.award = bytes.readUnsignedByte();
                struct.exp3 = bytes.readUnsignedInt();
                if (!StaticConfig.TianYuanVo_isNewServerConfig)
                    struct.topGift_type = bytes.readUnsignedByte();
                break;
            case 0x01:
                break;
            case 0x02:
                break;
            case 0x03:
                break;
            case 0x08:
                arr = [];
                count = bytes.readUnsignedByte();
                for (i = 0; i < count; i++) {
                    arr[i] = [bytes.readUnsignedByte()];
                }
                struct.countList = arr;
                break;
            case 0x05:
                arr = [];
                count = bytes.readUnsignedByte();
                for (i = 0; i < count; i++) {
                    arr[i] = [BytesUtil.readUserName(bytes), readPlayerId(bytes), bytes.readUnsignedInt(), bytes.readUnsignedByte()];
                }
                struct.memberList = arr;
                break;
            case 0x06:
                break;
            case 0x07:
                break;
            case 0x11:
                arr = [];
                struct.rankValue1 = bytes.readUnsignedInt();
                struct.rank1 = bytes.readUnsignedInt();
                count = bytes.readUnsignedByte();
                for (i = 0; i < count; i++) {
                    arr[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                }
                struct.list1 = arr;
                break;
            case 0x12:
                arr = [];
                struct.rankValue2 = bytes.readUnsignedInt();
                struct.rank2 = bytes.readUnsignedInt();
                count = bytes.readUnsignedByte();
                for (i = 0; i < count; i++) {
                    arr[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                }
                struct.list2 = arr;
                break;
            case 0x14:
                arr = [];
                struct.rankValue3 = bytes.readUnsignedInt();
                struct.rank3 = bytes.readUnsignedInt();
                count = bytes.readUnsignedByte();
                for (i = 0; i < count; i++) {
                    arr[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                }
                struct.list3 = arr;
                break;
            case 0x15:
                struct.topGift_type = bytes.readUnsignedByte();
                break;
        }
        return struct;
    }

    private static function readPlayerId(bytes:ByteArray):BigInteger {
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        var playerId:BigInteger;
        bytes.readBytes(idBytes, 0, 8);
        playerId = BytesUtil.readUint64(idBytes);
        return playerId;
    }
}
}
