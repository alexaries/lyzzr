package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class ActiveTimeCmd extends BaseCmd {
    public var type:uint = 0;

    public function ActiveTimeCmd() {
        this.msgType = MsgConst.ACTIVE_TIME;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
