package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CarnivalMsg extends BaseMsg {
    public var type:uint;
    public var gold:uint;
    public var tael:uint;
    public var coin:uint;
    public var itemID1:uint;
    public var itemID2:uint;
    public var itemID3:uint;

    public function CarnivalMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        if (type == 0) {
            gold = bytes.readUnsignedInt();
            tael = bytes.readUnsignedInt();
            coin = bytes.readUnsignedInt();
        } else {
            itemID1 = BytesUtil.readByte2(bytes);
            itemID2 = BytesUtil.readByte2(bytes);
            itemID3 = BytesUtil.readByte2(bytes);
        }

        return true;
    }
}
}
