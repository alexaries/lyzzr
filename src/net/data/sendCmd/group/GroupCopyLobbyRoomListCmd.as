package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyLobbyRoomListCmd extends BaseCmd {
    public var index:uint;
    public var count:uint;
    public var type:uint;

    public function GroupCopyLobbyRoomListCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x01);
            this.bodyBytes.writeUnsignedInt(index);
            this.bodyBytes.writeByte(count);
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
