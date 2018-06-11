package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyRoomJoinCmd extends BaseCmd {
    public var roomId:uint;
    public var pwd:String;

    public function GroupCopyRoomJoinCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeUnsignedInt(roomId);
            this.bodyBytes.writeUTF(pwd);
        }
        catch (e:*) {

        }
    }
}
}
