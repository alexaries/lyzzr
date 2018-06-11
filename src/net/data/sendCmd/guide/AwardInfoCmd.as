package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class AwardInfoCmd extends BaseCmd {
    public var type:uint;
    public var info:uint;

    public function AwardInfoCmd() {
        this.msgType = MsgConst.AWARD_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(info);
        } catch (e:*) {
        }
    }
}
}
