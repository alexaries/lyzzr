package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyRoomSortMsg extends BaseMsg {
    public var pos1:uint;
    public var pos2:uint;
    public var pos3:uint;

    public function GroupCopyRoomSortMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            pos1 = BytesUtil.readByte1(bytes);
            pos2 = BytesUtil.readByte1(bytes);
        } catch (e:*) {
        }
        return true;
    }
}
}
