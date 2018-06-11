package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupCopyAwardEndMsg extends BaseMsg {
    public var result:uint;

    public function GroupCopyAwardEndMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = bytes.readByte();
        } catch (e:*) {
        }
        return true;
    }
}
}
