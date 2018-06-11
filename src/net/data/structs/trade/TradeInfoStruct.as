package net.data.structs.trade {
public class TradeInfoStruct {
    public function TradeInfoStruct() {
    }

    public var type:uint = 0;//0不是装备1是装备
    public var itemId:uint = 0;
    public var pileNum:uint = 0;

    /**
     * 装备流水号
     */
    public var eqFlowId:uint = 0;
    /**
     * 强化等级
     */
    public var enhanceLevel:uint = 0;
    /**
     * 宝石孔数
     */
    public var boreNums:uint = 0;
    /**
     * 已镶嵌宝石个数
     */
    public var jewelNum:uint = 0;
    /**
     * 宝石id序列, 与孔数 相关,若孔没有宝石,则id为0
     */
    public var jewelIds:Array = [];
    /**
     * 附加属性个数
     */
    public var exNums:uint = 0;
    /**
     * 附加属性值列表 ,二维数组<br>
     * 第一位表示属性id(属性类型,1:体力,2:行动力,3:命中,4:闪躲,5:暴击,6:破击,7:反击)<br>
     * 第二位表示属性值
     * exProps[i][type,value]
     */
    public var exProps:Array = [];
}
}