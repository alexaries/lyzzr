package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PracticeAccCmd extends BaseCmd {
    public function PracticeAccCmd() {
        this.msgType = MsgConst.PRACTICE_ACC;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
