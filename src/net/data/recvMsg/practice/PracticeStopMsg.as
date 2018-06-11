package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PracticeStopMsg extends BaseMsg {
    /**已修炼时长*/
    public var time:uint = 0;
    /**花费银币数*/
    public var cost:uint = 0;
    /**剩余银币数*/
    public var remain:uint = 0;

    public function PracticeStopMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            time = bytes.readUnsignedInt();
            cost = BytesUtil.readByte2(bytes);
            remain = BytesUtil.readByte2(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}
