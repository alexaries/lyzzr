package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class ActiveInfoCmd extends BaseCmd {
    public function ActiveInfoCmd() {
        this.msgType = MsgConst.ACTIVE_INFO;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
