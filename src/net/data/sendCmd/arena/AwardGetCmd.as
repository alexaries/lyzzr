package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class AwardGetCmd extends BaseCmd {
    public function AwardGetCmd() {
        this.msgType = MsgConst.ARENA_AWARD_GET;
    }

    public var type:int = 0;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
