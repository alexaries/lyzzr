package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomFightCmd extends BaseCmd {
    public var type:uint;

    public function GroupCopyRoomFightCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x14);
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
