package net.data.sendCmd.gold {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class GoldGetCmd extends BaseCmd {
    public var type:uint = 0;
    public var type3366:uint = 0;

    public function GoldGetCmd() {
        this.msgType = MsgConst.GOLD_GET;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(type3366);
        }
        catch (e:*) {

        }
    }
}
}
