package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA6 请求邮件ID列表
 */
public class MailIdListCmd extends BaseCmd {
    /**
     * 当前页索引(0,1,2,3....................)
     */
    public var index:uint = 0;
    /**
     * 邮件数量n
     */
    public var count:uint = 0;

    public function MailIdListCmd() {
        this.msgType = MsgConst.MAIL_ID_LIST;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(index);
            this.bodyBytes.writeByte(count);
        }
        catch (e:*) {

        }
    }
}
}