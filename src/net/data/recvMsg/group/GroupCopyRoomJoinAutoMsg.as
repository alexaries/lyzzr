package net.data.recvMsg.group {

import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupCopyRoomJoinAutoMsg extends BaseMsg {
    public var copyId:uint;
    public var state:uint;

    public function GroupCopyRoomJoinAutoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            copyId = bytes.readByte();
            state = bytes.readByte();
        } catch (e:*) {
        }
        return true;
    }
}
}
