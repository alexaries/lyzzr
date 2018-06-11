package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xA3 发送邮件
 */
public class MailSendCmd extends BaseCmd {
    /**目标玩家名*/
    public var target:String = "";
    /**标题*/
    public var title:String = "";
    /**内容*/
    public var content:String = "";

    public function MailSendCmd() {
        this.msgType = MsgConst.MAIL_SEND;
    }

    override protected function createBody():void {
        try {
            BytesUtil.writeUserName(target, bodyBytes);
            this.bodyBytes.writeUTF(title);
            this.bodyBytes.writeUTF(content);
        }
        catch (e:*) {

        }
    }
}
}