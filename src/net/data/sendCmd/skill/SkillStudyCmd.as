package net.data.sendCmd.skill {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 学习心法
 */
public class SkillStudyCmd extends BaseCmd {
    /**目标玩家名*/
    public var target:String = "";
    /**标题*/
    public var title:String = "";
    /**内容*/
    public var content:String = "";

    public function SkillStudyCmd() {
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
