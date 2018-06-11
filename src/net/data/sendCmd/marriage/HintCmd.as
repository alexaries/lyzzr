package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class HintCmd extends BaseCmd {
    public var type:uint;

    public function HintCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x09);
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
        return;
    }
}
}