package net.data.structs.arena {
/**
 * @author hokenny
 */
public class FightInfoStruct {
    /*public var userName1:String = "";
     public var country1:uint = 2;
     public var userName2:String = "";
     public var country2:uint = 2;//默认值为2,表示还没有分阵营
     public var resultType:uint = 0;
     public var winNum:uint = 0;
     public var itemNum:uint = 0;//物品数量
     public var itemId:uint = 0;//物品数量
     //额外获得一次颜色挑战,颜色,2:绿,3蓝,4:紫,5:橙
     public var color:uint = 0;*/

    public var userName:String = "";
    public var country:uint = 2;//默认值为2,表示还没有分阵营
    public var career:uint = 0;
    public var sex:uint = 0;
    public var level:uint = 0;
    public var canFight:uint = 0;
    public var pf:uint = 0;
}
}
