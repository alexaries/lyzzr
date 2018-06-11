package net.data.recvMsg.endlessTower {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyRewardStruct;
import net.data.structs.endlessTower.EndlessTopStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class EndlessTowerMsg extends BaseMsg {
    public var type:uint;
    public var level:uint;
    public var maxlevel:uint;
    public var deamon_level:uint;
    public var left_time:uint;
    public var awards:uint;
    public var acc_time:uint;
    public var vitality:uint;
    public var spirit:uint;

    public var country:uint;
    public var clan_Name:String;
    public var battlepoint:uint;

    public var player_name:String;
    public var player_level:uint;
    public var all_len:uint;
    public var idx:uint;
    public var arrData:Array;
    public var result:uint;
    public var f_time:uint;
    public var flag:uint;
    public var item_ID:uint;
    public var item_num:uint;

    public function EndlessTowerMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
//			try {
        type = BytesUtil.readByte1(bytes);
        var i:int;
        var len:int;
        switch (type) {
            case 0:
                level = BytesUtil.readByte2(bytes);
                maxlevel = BytesUtil.readByte2(bytes);
                deamon_level = BytesUtil.readByte2(bytes);
                left_time = bytes.readUnsignedInt();
                f_time = bytes.readUnsignedInt();
                awards = bytes.readUnsignedInt();
                acc_time = bytes.readUnsignedInt();
                vitality = bytes.readUnsignedInt();
                spirit = bytes.readUnsignedInt();
                break;
            case 1:
                level = BytesUtil.readByte2(bytes);
                player_name = BytesUtil.readUserName(bytes);
                player_level = BytesUtil.readByte1(bytes);
                left_time = bytes.readUnsignedInt();
                awards = bytes.readUnsignedInt();
                spirit = bytes.readUnsignedInt();
                country = BytesUtil.readByte1(bytes);
                clan_Name = BytesUtil.readUserName(bytes);
                battlepoint = bytes.readUnsignedInt();
                break;
            case 2:
                all_len = BytesUtil.readByte2(bytes);
                idx = BytesUtil.readByte2(bytes);
                len = BytesUtil.readByte1(bytes);
                arrData = [];
                for (i = 0; i < len; i++) {
                    var struct:EndlessTopStruct = new EndlessTopStruct();
                    struct.sealLevel = BytesUtil.readByte2(bytes);
                    struct.pname = BytesUtil.readUserName(bytes);
                    struct.plevel = BytesUtil.readByte1(bytes);
                    struct.getSoal = BytesUtil.readByte2(bytes);
                    struct.soalLeft = bytes.readUnsignedInt();
                    ;
                    arrData.push(struct);
                }
                break;
            case 3:
                result = BytesUtil.readByte1(bytes);
                left_time = bytes.readUnsignedInt();
                break;
            case 4:
                result = BytesUtil.readByte1(bytes);
                vitality = bytes.readUnsignedInt();
                break;
            case 5:
                level = BytesUtil.readByte2(bytes);
                flag = BytesUtil.readByte1(bytes);
                result = BytesUtil.readByte1(bytes);
                if (flag == 1) {
                    f_time = bytes.readUnsignedInt();
                }
                break;
            case 6:
                result = BytesUtil.readByte1(bytes);
                break;
            case 7:
                result = BytesUtil.readByte1(bytes);
                if (result == 0) {
                    level = BytesUtil.readByte2(bytes);
                    awards = bytes.readUnsignedInt();
                    len = BytesUtil.readByte2(bytes);

                    arrData = [];
                    var copyReward:CopyRewardStruct;
                    for (i = 0; i < len; i++) {
                        copyReward = new CopyRewardStruct();
                        copyReward.itemId = BytesUtil.readByte2(bytes);
                        copyReward.itemNum = BytesUtil.readByte1(bytes);
                        arrData.push(copyReward);
                    }
                } else {
                }
                break;
            case 8:
                level = BytesUtil.readByte2(bytes);
                item_ID = BytesUtil.readByte2(bytes);
                item_num = BytesUtil.readByte1(bytes);
                player_name = BytesUtil.readUserName(bytes);
                break;
            case 9:
                level = BytesUtil.readByte1(bytes);
                len = BytesUtil.readByte1(bytes);
                arrData = [];
                for (var j:int = 0; j < len; j++) {
                    var obj:Object = new Object();
                    obj.index = j;
                    obj.lv = BytesUtil.readByte1(bytes);
                    obj.flag = BytesUtil.readByte1(bytes);
                    obj.itemID = BytesUtil.readByte2(bytes);
                    arrData.push(obj);
                }
                break;
            default:
                break;
        }
//			} catch(e : *) {
//			}
        return true;
    }
}
}
