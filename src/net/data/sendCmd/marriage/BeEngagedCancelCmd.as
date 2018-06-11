package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class BeEngagedCancelCmd extends BaseCmd {
    public function BeEngagedCancelCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x06);
            this.bodyBytes.writeByte(0x02);
        }
        catch (e:*) {

        }
        return;
    }
}
}