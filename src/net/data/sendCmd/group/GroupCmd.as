package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCmd extends BaseCmd {
    public function GroupCmd() {
        this.msgType = MsgConst.GOLD_INFO;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
