package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA2 删除邮件
 */
public class MailDeleteCmd extends BaseCmd {
    /**
     * 邮件id列表
     */
    private var _mailArr:Array;

    public function MailDeleteCmd() {
        this.msgType = MsgConst.MAIL_DELETE;
    }

    public function get mailArr():Array {
        return _mailArr;
    }

    public function set mailArr(value:Array):void {
        _mailArr = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(mailArr.length);
            for (var i:uint = 0; i < mailArr.length; i++) {
                this.bodyBytes.writeUnsignedInt(mailArr[i]);
            }
        }
        catch (e:*) {

        }
    }

}
}