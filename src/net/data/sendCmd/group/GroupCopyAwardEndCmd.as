package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyAwardEndCmd extends BaseCmd {
    public function GroupCopyAwardEndCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x0e);
        }
        catch (e:*) {

        }
    }
}
}
