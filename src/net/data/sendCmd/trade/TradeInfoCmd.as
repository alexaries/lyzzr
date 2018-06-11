package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeInfoCmd extends BaseCmd {
    public var tradeId:uint = 0;

    public function TradeInfoCmd() {
        this.msgType = MsgConst.TRADE_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(tradeId);
        }
        catch (e:*) {

        }
    }
}
}
