package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class BeEngagedCmd extends BaseCmd {
    public var spec:uint;
    public var date:uint;

    public function BeEngagedCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x06);
            this.bodyBytes.writeByte(0x01);
            this.bodyBytes.writeByte(spec);
            this.bodyBytes.writeUnsignedInt(date);
        }
        catch (e:*) {

        }
        return;
    }
}
}