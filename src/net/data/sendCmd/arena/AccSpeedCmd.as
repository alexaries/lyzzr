package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class AccSpeedCmd extends BaseCmd {
    public function AccSpeedCmd() {
        this.msgType = MsgConst.ARENA_SPEED;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
