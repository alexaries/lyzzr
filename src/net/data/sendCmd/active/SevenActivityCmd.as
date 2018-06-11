package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C-S) 七日活动
 * @author ryan
 */
public class SevenActivityCmd extends BaseCmd {
    public var type:int;
    public var will:int;

    public function SevenActivityCmd() {
        super();
        msgType = MsgConst.SEVEN_ACTIVITY;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 4)
                bodyBytes.writeByte(will);
            else if ([8, 11, 13, 15, 17].indexOf(type) > -1)
                bodyBytes.writeByte(will);
            else if ([9, 12, 14, 16, 18].indexOf(type) > -1)
                bodyBytes.writeByte(will);
            switch (type) {
                case 21:
                    bodyBytes.writeByte(will);
                    break;
                case 23:
                    bodyBytes.writeByte(will);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}
