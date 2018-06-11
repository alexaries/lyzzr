package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomSortCmd extends BaseCmd {
    public var pos1:uint;
    public var pos2:uint;
    public var pos3:uint;

    public function GroupCopyRoomSortCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x13);
            this.bodyBytes.writeByte(pos1);
            this.bodyBytes.writeByte(pos2);
        }
        catch (e:*) {

        }
    }
}
}
