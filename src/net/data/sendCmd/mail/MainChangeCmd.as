package net.data.sendCmd.mail {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA5 邮件点击确认
 */
public class MainChangeCmd extends BaseCmd {
    /**
     *  点击按钮编号
     * 0-确认
     * 1-拒绝
     */
    public var actionType:uint = 0;
    /**
     * 编号
     */
    private var _mailId:uint = 0;

    public function MainChangeCmd() {
        this.msgType = MsgConst.MAIL_CHANGE;
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
            this.bodyBytes.writeByte(actionType);
        }
        catch (e:*) {

        }
    }

}
}