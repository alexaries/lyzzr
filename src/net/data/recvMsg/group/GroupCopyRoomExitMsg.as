package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyRoomExitMsg extends BaseMsg {
    public var result:int;

    public function GroupCopyRoomExitMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
        } catch (e:*) {
        }
        return true;
    }
}
}
