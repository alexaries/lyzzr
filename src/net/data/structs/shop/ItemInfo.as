package net.data.structs.shop {
public class ItemInfo {
    /**
     *  物品编号
     */
    public var itemId:uint = 0;
    /**
     * 价格，如果类型为4是礼券，否则为元宝
     */
    public var price:uint = 0;
    public var priceId:uint = 0;
    public var left:uint = 0;
    public var beginTime:uint = 0;
    public var endTime:uint = 0;
    public var flag:uint = 0;
    public var oldPrice:uint = 0;
    /**
     * 特殊限购类型 0 普通限购 1 消费限购 2 充值限购
     */
    public var exType:uint = 0;
    /**
     * 特殊限购所需的仙石数（消费/充值）
     */
    public var exGold:uint = 0;
    /**
     *需求的仙阶
     */
    public var needScoreLevel:int;

    public function ItemInfo() {
    }
}
}