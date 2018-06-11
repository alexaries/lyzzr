package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class GuideSaveProcessCmd extends BaseCmd {
    public var step:uint = 0;

    public function GuideSaveProcessCmd() {
        this.msgType = MsgConst.NEW_HAND_STEP;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(step);
        } catch (e:*) {
        }
    }
}
}

