package net.data.recvMsg.chat {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xF8 bug信息提交是否成功
 */
public class BugMsg extends BaseMsg {
    /**
     * bug提交是否成功，0:不成功，1:为成功
     */
    public var success:uint = 0;

    public function BugMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            success = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}