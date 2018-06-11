package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyFightStartCmd extends BaseCmd {
    public function GroupCopyFightStartCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
