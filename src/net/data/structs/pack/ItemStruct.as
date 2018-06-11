package net.data.structs.pack {
import net.data.structs.zhenyuan.ZhenyuanStruct;

/**
 * 物品结构
 */
public class ItemStruct {
    public static const COMM:int = 0;  //普通
    public static const EQ:int = 1;  //装备
    public static const TALISMAN:int = 2;  //法宝
    public static const RANK:int = 3;  //阵法
    public static const HEART:int = 4;  //心法
    public static const JEWELS:int = 5;  //宝石
    /**
     *魂魄
     */
    public static const SOUL:int = 6;  //魂魄
    public static const SOUL_2:int = 7;  //元神
    public static const BAOJU:int = 8;	 //宝具
    public static const TASK:int = 9;  //任务
    public static const HUNQI:int = 10;  //魂器  (魂器 在背包数组索引为10，魂器按钮索引为9 ，请区分)
    public static const LINGZHU:int = 11;//灵珠

    public static const TYPE_NUM:int = 12;  //包裹类型数量
    public static const TRADE_PILE_NUM:int = 99;   //交易堆叠数量

    /**
     * 是否为装备,0:普通,1:装备,2:宝石,3:任务,4:其它
     */
    public var type:int = 0;
    /**
     * 物品编号, 如果是装备类物品， 需要填写流水号， 并且如果是添加装备，则追加装备属性信息
     */
    public var itemId:Number = 0;
    /**
     * 绑定属性,0不绑定,1绑定
     */
    public var binding:int = 0;
    /**
     * 为0，则表示删除指定物品，不为0,则为改变数据
     */
    public var itemNums:int = 0;
    /**
     * 装备动态信息
     */
    public var eqInfo:EqInfoStruct = new EqInfoStruct();

    /**
     * 阵元
     */
    public var zhenyuanVO:ZhenyuanStruct;
    public var time:int = 0;

    public function ItemStruct() {
    }
}
}