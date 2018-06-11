package net.data.structs.trade {
public class TradeListStruct {
    public var id:uint = 0;
    public var userName:String = "";
    public var title:String = "";
    /** 0:对方确认交易,交易成功,1:自己确认交易,交易成功,2:等待对方回复,3:等待自己回复,4:等待对方确认,5:等待自己确认,6:交易被终止,7:对方确认交易*/
    public var state:uint = 0;
    public var time:uint = 0;

    public function TradeListStruct() {
    }
}
}