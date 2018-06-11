package net.data.recvMsg.friend {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class GFriendRewardMsg extends BaseMsg {
    public var type:uint;
    public var idx:uint;
    public var status:uint;
    public var statusArr:Array;

    public function GFriendRewardMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0:
                    idx = BytesUtil.readByte1(bytes);
                    status = BytesUtil.readByte1(bytes);
                    break;
                case 1:
                    statusArr = [];
                    var len:int = BytesUtil.readByte1(bytes);
                    for (var i:int = 0; i < len; i++) {
                        statusArr.push(BytesUtil.readByte1(bytes));
                    }
                    break;
                default:
            }
        } catch (error:*) {

        }
        return true;
    }
}
}
