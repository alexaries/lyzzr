package net.data.sendCmd.gold {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class GoldInfoCmd extends BaseCmd {
    public function GoldInfoCmd() {
        this.msgType = MsgConst.GOLD_INFO;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
