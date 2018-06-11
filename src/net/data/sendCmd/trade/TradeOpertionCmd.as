package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeOpertionCmd extends BaseCmd {
    public var id:uint = 0;
    public var op:uint = 0;

    public function TradeOpertionCmd() {
        this.msgType = MsgConst.TRADE_OPERATION;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(id);
            this.bodyBytes.writeByte(op);
        }
        catch (e:*) {

        }
    }
}
}
