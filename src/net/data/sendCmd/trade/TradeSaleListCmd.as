package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeSaleListCmd extends BaseCmd {
    public var startIndex:uint = 0;
    public var count:uint = 0;
    public var searchSort:uint = 0;
    public var keyword:String = "";
    public var type:uint = 0;
    public var sort:uint = 0;
    public var color:uint = 0;
    public var eqType:uint = 0;
    public var career:uint = 0;
    public var prop:uint = 0;

    public function TradeSaleListCmd() {
        this.msgType = MsgConst.TRADE_SALE_LIST;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeShort(startIndex);
            this.bodyBytes.writeShort(count);
            //this.bodyBytes.writeByte(searchSort);
            this.bodyBytes.writeUTF(keyword);
            this.bodyBytes.writeByte(type);
            //this.bodyBytes.writeByte(sort);
            this.bodyBytes.writeByte(color);
            this.bodyBytes.writeByte(career);
            this.bodyBytes.writeByte(prop);
            this.bodyBytes.writeByte(eqType);
        }
        catch (e:*) {

        }
    }
}
}
