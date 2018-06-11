package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyAwardInfoMsg extends BaseMsg {
    public var copyId:uint;
    public var roll:uint;
    public var goodsId:uint;

    public function GroupCopyAwardInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            copyId = BytesUtil.readByte1(bytes);
            roll = BytesUtil.readByte1(bytes);
            goodsId = bytes.readUnsignedInt();
        } catch (e:*) {
        }
        return true;
    }
}
}
