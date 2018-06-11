/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-3-25
 * Time: 下午4:28
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {
import utils.ByteArray;

import net.utils.BytesUtil;

public class ChaosFightStruct {
    public var type:uint;
    public var isOpen:uint;
    public var time:uint;
    public var posInfo:uint; //所在位置
    public var starTotal:Number;//总五角星
    public var starList:Array;//当层五角星列表
    public var fightCount:uint;//可挑战次数
    public var killCount:uint;//连斩杀人数
    public var needCount:Number;//需要星级个数
    public var starRank:uint;//本层星级排名
    public var rankList:Array;//自己排名前玩家
    public var getAwardLv:uint;//奖励领取
    public var isDoubleBuff:Boolean;
    public var rank:uint;
    public var playerList:Array;

    public var page:uint;
    public var pageMax:uint;

    public var reportList:Array;
    public var countList:Array;

    public function ChaosFightStruct() {
    }

    public static function read(bytes:ByteArray):ChaosFightStruct {
        var struct:ChaosFightStruct = new ChaosFightStruct();
        var len:uint;
        var i:uint;
        var args:Array;
        struct.type = BytesUtil.readByte1(bytes);
        switch (struct.type) {
            case 0x00:
                break;
            case 0x01:
                struct.isOpen = bytes.readUnsignedByte();
                struct.time = bytes.readUnsignedInt();
                break;
            case 0x02:
                struct.posInfo = bytes.readUnsignedByte();
                struct.starTotal = bytes.readUnsignedShort() / 2;
                len = bytes.readUnsignedByte();
                struct.starList = [];
                for (i = 0; i < len; i++) {
                    //args = [];
                    struct.starList.push(bytes.readUnsignedShort() / 2);
                }
                struct.fightCount = bytes.readUnsignedByte();
                struct.killCount = bytes.readUnsignedByte();
                struct.needCount = bytes.readUnsignedByte() / 2;
                struct.starRank = bytes.readUnsignedInt();
                len = bytes.readUnsignedByte();
                struct.rankList = [];
                for (i = 0; i < len; i++) {
                    args = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt(), bytes.readUnsignedShort() / 2, bytes.readUnsignedByte(), bytes.readUnsignedByte()];
                    struct.rankList.push(args);
                }
                struct.getAwardLv = bytes.readUnsignedByte();
                struct.isDoubleBuff = bytes.readBoolean();
                break;
            case 0x03:
                struct.countList = [];
                struct.page = bytes.readUnsignedByte();
                struct.pageMax = bytes.readUnsignedInt();
                len = bytes.readUnsignedByte();
                for (i = 0; i < len; i++) {
                    args = [];
                    args.push(BytesUtil.readUserName(bytes));

                    var idBytes:ByteArray = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);

                    args.push(BytesUtil.readUint64(idBytes));
                    args.push(bytes.readUnsignedByte());
                    args.push(bytes.readUnsignedByte());

                    struct.countList.push(args);
                }
                break;
            case 0x04:
                len = bytes.readUnsignedByte();
                struct.reportList = [];
                for (i = 0; i < len; i++) {
                    args = [BytesUtil.readUserName(bytes), bytes.readUnsignedByte(), bytes.readUnsignedByte(), bytes.readUnsignedInt()];
                    struct.reportList.push(args);
                }
                break;
            case 0x05:
                break;
            case 0x06:
                break;
            case 0x07:
                break;
            case 0x08:
                struct.getAwardLv = bytes.readUnsignedByte();
                break;
            case 0x09:
                break;
        }
        return struct;
    }
}
}
