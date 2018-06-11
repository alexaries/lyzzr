package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C-S) 七日活动
 * @author ryan
 */
public class SevenBackActivityCmd extends BaseCmd {
    public var type:int;
    public var will:int;

    public function SevenBackActivityCmd() {
        super();
        msgType = MsgConst.SEVEN_BACK_ACTIVITY;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 4)
                bodyBytes.writeByte(will);
        } catch (e:*) {
        }
    }
}
}
