package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CheckIDMsg extends BaseMsg {
    public var field:uint;

    public function CheckIDMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        field = BytesUtil.readByte1(bytes);

        return true;
    }
}
}
