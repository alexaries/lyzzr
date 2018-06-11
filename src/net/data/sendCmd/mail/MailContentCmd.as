package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA1 请求邮件内容
 */
public class MailContentCmd extends BaseCmd {
    /**邮件id*/
    private var _mailId:uint = 0;

    public function MailContentCmd() {
        this.msgType = MsgConst.MAIL_CONTENT;
    }

    public function get mailId():uint {
        return _mailId;
    }

    public function set mailId(value:uint):void {
        _mailId = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(mailId);
        }
        catch (e:*) {

        }
    }
}
}