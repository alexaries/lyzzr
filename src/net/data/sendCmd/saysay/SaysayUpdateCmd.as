package net.data.sendCmd.saysay {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x38  领取在线奖励
 */
public class SaysayUpdateCmd extends BaseCmd {
    public var index:uint = 0;

    public function SaysayUpdateCmd() {
        this.msgType = MsgConst.SAY_SAY;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(index);
        }
        catch (e:*) {

        }
    }
}
}