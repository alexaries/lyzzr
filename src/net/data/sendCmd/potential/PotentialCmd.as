package net.data.sendCmd.potential {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x2C 潜力洗炼
 */
public class PotentialCmd extends BaseCmd {
    public function PotentialCmd() {
        this.msgType = MsgConst.POTENTIAL;
    }

    public var fgtId:uint = 0;
    public var type:uint = 0;

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(fgtId);
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}