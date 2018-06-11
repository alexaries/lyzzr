package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PracticeStopCmd extends BaseCmd {
    public function PracticeStopCmd() {
        this.msgType = MsgConst.PRACTICE_STOP;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
