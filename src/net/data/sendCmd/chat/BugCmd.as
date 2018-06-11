package net.data.sendCmd.chat {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xF8 bug信息提交
 */
public class BugCmd extends BaseCmd {
    /**
     * 标题
     */
    public var title:String = "";
    /**
     * 消息内容
     */
    public var content:String = "";

    public function BugCmd() {
        this.msgType = MsgConst.BUG;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUTF(title);
            this.bodyBytes.writeUTF(content);
        }
        catch (e:*) {

        }
    }
}
}