package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class N525Cmd extends BaseCmd {
    public function N525Cmd() {
        super();
        msgType = MsgConst.N525_INFO;
    }

    override protected function createBody():void {
        try {
        } catch (e:*) {
        }
    }
}
}
