package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA0 请求邮件列表
 */
public class MailListCmd extends BaseCmd {
    /**邮件id列表*/
    private var _mailIds:Array = [];

    public function MailListCmd() {
        this.msgType = MsgConst.MAIL_LIST;
    }

    public function get mailIds():Array {
        return _mailIds;
    }

    public function set mailIds(value:Array):void {
        _mailIds = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(_mailIds.length);
            for (var i:uint = 0; i < _mailIds.length; i++)
                this.bodyBytes.writeUnsignedInt(_mailIds[i]);
        }
        catch (e:*) {

        }
    }
}
}