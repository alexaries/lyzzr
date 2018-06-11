package net.data.recvMsg.guide {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * @author john
 */
public class GuideCampSelectMsg extends BaseMsg {
    public var country:uint;

    public function GuideCampSelectMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        country = BytesUtil.readByte1(bytes);

        return true;
    }
}
}
