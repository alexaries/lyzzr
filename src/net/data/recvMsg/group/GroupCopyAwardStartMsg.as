package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupCopyAwardStartMsg extends BaseMsg {
    public var goodsId:uint;

    public function GroupCopyAwardStartMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            goodsId = bytes.readUnsignedInt();
        } catch (e:*) {
        }
        return true;
    }
}
}
