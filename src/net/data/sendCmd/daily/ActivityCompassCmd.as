package net.data.sendCmd.daily {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class ActivityCompassCmd extends BaseCmd {
    public var type:uint;

    public function ActivityCompassCmd() {
        msgType = MsgConst.ACTIVITY_COMPASS;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        } catch (e:*) {
        }
    }
}
}
