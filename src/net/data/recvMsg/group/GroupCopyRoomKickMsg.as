package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupCopyRoomKickMsg extends BaseMsg {
    public var result:uint;

    public function GroupCopyRoomKickMsg() {
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
