package net.data.recvMsg.arena {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class ArenaUpdateMsg extends BaseMsg {
    public var type:uint = 0;
    public var color:uint = 0;

    public function ArenaUpdateMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte2(bytes);
        if (type == 0) {
            color = BytesUtil.readByte1(bytes);
        }

        return true;
    }
}
}
