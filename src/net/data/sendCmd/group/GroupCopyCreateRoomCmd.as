package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyCreateRoomCmd extends BaseCmd {
    public var copyId:uint;
    public var pwd:String;
    public var st:uint;
    public var ed:uint;

    public function GroupCopyCreateRoomCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x02);
            this.bodyBytes.writeUTF(pwd);
            this.bodyBytes.writeByte(st);
            this.bodyBytes.writeByte(ed);
        }
        catch (e:*) {

        }
    }
}
}
