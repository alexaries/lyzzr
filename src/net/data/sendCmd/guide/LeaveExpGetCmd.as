package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class LeaveExpGetCmd extends BaseCmd {

    public function LeaveExpGetCmd() {
        this.msgType = MsgConst.LEAVE_EXP;
    }

    override protected function createBody():void {
//			try {
//			} catch(e : *) {
//			}
    }
}
}
