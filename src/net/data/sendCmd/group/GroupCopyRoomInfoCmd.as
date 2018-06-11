package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomInfoCmd extends BaseCmd {
    public function GroupCopyRoomInfoCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x10);
        }
        catch (e:*) {

        }
    }
}
}
