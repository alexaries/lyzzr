package net.data.recvMsg.guide {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * @author john
 */
public class FourDetectiveMsg extends BaseMsg {
    public var type:uint;
    public var count1:uint;
    public var count2:uint;
    public var count3:uint;
    public var count4:uint;
    public var count:uint;

    public function FourDetectiveMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 0:
                count1 = BytesUtil.readByte2(bytes);
                count2 = BytesUtil.readByte2(bytes);
                count3 = BytesUtil.readByte2(bytes);
                count4 = BytesUtil.readByte2(bytes);
                break;
            default:
                count = BytesUtil.readByte2(bytes);
                break;
        }

        return true;
    }
}
}
