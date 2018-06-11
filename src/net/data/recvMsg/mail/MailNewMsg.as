package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA4 新邮件通知
 */
public class MailNewMsg extends BaseMsg {

    public var mailNum:int;

    public function MailNewMsg() {

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            mailNum = BytesUtil.readByte2(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}