package net.data.sendCmd.saysay {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x07  领取在线奖励
 */
public class SaysayNewCmd extends BaseCmd {
    public var type:uint = 0;
    public var state:uint = 0;

    public function SaysayNewCmd() {
        this.msgType = MsgConst.GFRIEND_REWARD;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(state);
        }
        catch (e:*) {

        }
    }
}
}