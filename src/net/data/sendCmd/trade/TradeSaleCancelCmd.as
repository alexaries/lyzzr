package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeSaleCancelCmd extends BaseCmd {
    public var id:uint = 0;
    public var flag:uint = 0;

    public function TradeSaleCancelCmd() {
        this.msgType = MsgConst.TRADE_SALE_CANCEL;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(flag);
            this.bodyBytes.writeUnsignedInt(id);
        }
        catch (e:*) {

        }
    }
}
}
