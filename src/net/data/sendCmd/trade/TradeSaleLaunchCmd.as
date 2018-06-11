package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.data.structs.trade.TradeSaleListStruct;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class TradeSaleLaunchCmd extends BaseCmd {
    public var arr:Array;

    public function TradeSaleLaunchCmd() {
        this.msgType = MsgConst.TRADE_SALE_LAUNCH;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeShort(arr.length);
            for each(var saleItem:TradeSaleListStruct in arr) {
                BytesUtil.writeBigInt(saleItem.id, bodyBytes);
                this.bodyBytes.writeShort(saleItem.count);
                this.bodyBytes.writeUnsignedInt(saleItem.price);
                this.bodyBytes.writeByte(saleItem.priceType);
            }
        }
        catch (e:*) {

        }
    }
}
}
