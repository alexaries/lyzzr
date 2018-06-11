package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class QQBuffMsg extends BaseMsg {
    public var state1:uint;
    public var state2:uint;
    public var state3:uint;
    public var state4:uint;

    public function QQBuffMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            state1 = BytesUtil.readByte1(bytes);
            state2 = BytesUtil.readByte1(bytes);
            state3 = BytesUtil.readByte1(bytes);
            state4 = BytesUtil.readByte1(bytes);
        } catch (e:*) {
        }
        return true;
    }
}
}
