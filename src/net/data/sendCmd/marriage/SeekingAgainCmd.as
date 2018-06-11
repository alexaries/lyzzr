package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SeekingAgainCmd extends BaseCmd {
    public var type:uint;

    public function SeekingAgainCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(7);
        }
        catch (e:*) {

        }
        return;
    }
}
}