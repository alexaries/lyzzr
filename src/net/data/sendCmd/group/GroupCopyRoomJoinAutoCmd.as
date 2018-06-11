package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomJoinAutoCmd extends BaseCmd {
    public function GroupCopyRoomJoinAutoCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x05);
        }
        catch (e:*) {

        }
    }
}
}
