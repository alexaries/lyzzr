package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PracticeAccMsg extends BaseMsg {
    /**0:成功,1:失败*/
    public var result:uint = 0;

    public function PracticeAccMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}
