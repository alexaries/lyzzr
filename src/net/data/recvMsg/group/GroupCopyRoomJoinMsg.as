package net.data.recvMsg.group {

import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author hokenny
 */
public class GroupCopyRoomJoinMsg extends BaseMsg {
    public var roomId:uint;

    public function GroupCopyRoomJoinMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            roomId = bytes.readUnsignedInt();
        } catch (e:*) {
        }
        return true;
    }
}
}
