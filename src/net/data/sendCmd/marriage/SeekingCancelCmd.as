package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SeekingCancelCmd extends BaseCmd {
    public function SeekingCancelCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(0x04);
        }
        catch (e:*) {

        }
        return;
    }
}
}