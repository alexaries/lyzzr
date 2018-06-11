package net.data.structs.trade {
import net.data.structs.pack.ItemStruct;

/**
 * @author hokenny
 */
public class TradeSaleListStruct {
    public var id:Number = 0;
    public var name:String = "";
    public var price:uint = 0;
    public var priceType:uint = 0;
    public var item:ItemStruct;
    public var hasNotify:uint = 0;
    public var count:uint = 0;

    /**
     * 交易上架时间 繁体平台才有
     * */
    public var onSaletime:uint = 0;
}
}
