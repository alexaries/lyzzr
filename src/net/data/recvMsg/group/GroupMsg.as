package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupMsg extends BaseMsg {
    public function GroupMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
        } catch (e:*) {
        }
        return true;
    }
}
}
