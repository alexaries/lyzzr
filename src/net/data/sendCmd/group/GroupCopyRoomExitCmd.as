package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomExitCmd extends BaseCmd {
    public function GroupCopyRoomExitCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x04);
        }
        catch (e:*) {

        }
    }
}
}
