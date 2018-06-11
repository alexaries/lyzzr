package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.mail.MailStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA0 邮件列表
 */
public class MailListMsg extends BaseMsg {
    private var _mailArr:Array;

    public function MailListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _mailArr = [];
        var mailNums:uint = BytesUtil.readByte1(bytes);
        var mailStruct:MailStruct;
        for (var i:uint = 0; i < mailNums; i++) {
            mailStruct = new MailStruct();
            mailStruct.mailId = bytes.readUnsignedInt();
            mailStruct.sender = BytesUtil.readUserName(bytes);
            mailStruct.recvTime = bytes.readUnsignedInt();
            mailStruct.type = BytesUtil.readByte1(bytes);
            mailStruct.title = bytes.readUTF();
            mailStruct.hasItem = BytesUtil.readByte1(bytes);
            _mailArr.push(mailStruct);
        }

        return true;
    }

    public function getMailListVO():Array {
        return _mailArr;
    }
}
}