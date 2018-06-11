package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeListCmd extends BaseCmd {
    public var start:uint = 0;
    public var num:uint = 0;

    public function TradeListCmd() {
        this.msgType = MsgConst.TRADE_LIST;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeShort(start);
            this.bodyBytes.writeShort(num);
        }
        catch (e:*) {

        }
    }
}
}
