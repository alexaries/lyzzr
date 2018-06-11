package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class MarriageInfoCmd extends BaseCmd {
    public function MarriageInfoCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x01);
        }
        catch (e:*) {

        }
        return;
    }
}
}