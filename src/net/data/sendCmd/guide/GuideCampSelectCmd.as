package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class GuideCampSelectCmd extends BaseCmd {
    public var country:uint = 0;

    public function GuideCampSelectCmd() {
        this.msgType = MsgConst.CAMPS_CHOICE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(country);
        } catch (e:*) {
        }
    }
}
}
