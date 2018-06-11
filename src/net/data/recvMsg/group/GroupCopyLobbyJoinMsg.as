package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyLobbyJoinMsg extends BaseMsg {
    public var copyId:uint;
    public var state:uint;

    public function GroupCopyLobbyJoinMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            copyId = BytesUtil.readByte1(bytes);
            state = BytesUtil.readByte1(bytes);
        } catch (e:*) {
        }
        return true;
    }
}
}
