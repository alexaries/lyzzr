package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class GiveupReplyCmd extends BaseCmd {
    public var type:uint;

    public function GiveupReplyCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x04);
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
        return;
    }
}
}