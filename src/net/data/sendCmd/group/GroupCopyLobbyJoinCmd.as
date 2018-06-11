package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyLobbyJoinCmd extends BaseCmd {
    public var copyId:uint;
    public var type:uint;
    public var state:uint;

    public function GroupCopyLobbyJoinCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x00);
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(copyId);
            this.bodyBytes.writeByte(state);
        }
        catch (e:*) {

        }
    }
}
}
