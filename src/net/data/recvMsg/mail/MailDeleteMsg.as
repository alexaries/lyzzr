package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA2 确认删除邮件
 */
public class MailDeleteMsg extends BaseMsg {
    private var mailArr:Array;

    public function MailDeleteMsg() {

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            mailArr = [];
            var mailNums:uint = BytesUtil.readByte1(bytes);
            for (var i:uint = 0; i < mailNums; i++) {
                mailArr.push(bytes.readUnsignedInt());
            }
        }
        catch (e:*) {

        }
        return true;
    }

    public function getDeleteMailVO():Array {
        return mailArr;
    }
}
}