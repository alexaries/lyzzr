package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CDepotMsg extends BaseMsg {
    private var _type:uint;
    public var max_pack:uint;
    public var curr_pack:uint;
    public var cent:uint;
    public var hasReward:uint;
    public var itemList:Array = [];
    public var itemObj:Object;
    public var flag:int = 0;

    public function CDepotMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int = 0;

            switch (_type) {
                case 0:
                    max_pack = BytesUtil.readByte2(bytes);
                    curr_pack = BytesUtil.readByte2(bytes);
                    cent = bytes.readUnsignedInt();
                    hasReward = BytesUtil.readByte1(bytes);
                    break;
                case 1:
                case 3:
                    itemList = [];
                    len = BytesUtil.readByte2(bytes);
                    for (i = 0; i < len; i++) {
                        itemObj = new Object();
                        itemObj.itemid = BytesUtil.readByte2(bytes);
                        itemObj.itemnum = BytesUtil.readByte2(bytes);
                        itemList.push(itemObj);
                    }
                    break;
                case 2:
                case 4:
                    flag = BytesUtil.readByte1(bytes);
                    itemObj = new Object();
                    itemObj.itemid = BytesUtil.readByte2(bytes);
                    itemObj.itemnum = BytesUtil.readByte2(bytes);
                    break;
                default:
            }
        } catch (e:*) {
        }
        return true;
    }

    public function get type():uint {
        return _type;
    }
}
}
