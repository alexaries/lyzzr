package net.data.structs.pack {
/**
 * 装备结构体
 */
public class EqInfoStruct {
    /**
     * 装备id
     */
    public var eqId:int = 0;
    /**
     * 是否绑定,0为不绑定,1为绑定,2为获取绑定
     */
    public var binding:int = 0;
    /**
     * 装备流水号
     */
    public var flowId:Number = 0;
    /**
     * 强化等级
     */
    public var enhanceLevel:int = 0;
    /**
     * 宝石孔数
     */
    public var boreNums:int = 0;
    /**
     * 宝石id序列, 与孔数 相关,若孔没有宝石,则id为0
     */
    public var jewelIds:Array = [];
    /**
     * 附加属性个数
     */
    public var exNums:int = 0;
    /**
     * 附加属性值列表 ,二维数组<br>
     * 第一位表示属性id(属性类型,1:体力,2:行动力,3:命中,4:闪躲,5:暴击,6:破击,7:反击)<br>
     * 第二位表示属性值
     * exProps[i][type,value]
     */
    public var exProps:Array = [];
    public var currentLevel:int = 0;
    public var maxLevel:int = 0;
    public var currentExp:int = 0;
    public var soulLevel:Array = [];
    public var soulFormula:Array = [];

    /**
     * 灵宝相关属性
     */
    public var isTongLing:int = 0;
    public var lbColor:int = 0;
    public var lingbaoAttr:Array = [];
    public var skill1:int;
    public var factor1:Number;
    public var skill2:int;
    public var factor2:Number;


    /****魂器属性**/
    public var critDef:int;   // 暴击抗性
    public var pierceDef:int;   //破击抗性
    public var repelDef:int;   //反击抗性
    public var ap:int;  //攻击穿透

    public var diaowenNum:int;
    public var diaowenIds:Array = [];

    public function EqInfoStruct() {
    }
}
}