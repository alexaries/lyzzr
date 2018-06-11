package net.data.structs.sort {

import net.data.structs.pack.ItemStruct;
import net.data.structs.pet.PetStruct;

/**
 * 排行榜数据结构
 */
public dynamic class SortItemStruct {
    /**等级*/
    public static const LEVEL:uint = 0;
    /**金钱*/
    public static const ARENA:uint = 1;
    /**战功*/
    public static const FIGHT_SCORE:uint = 2;
    /**宗族*/
    public static const CLAN:uint = 3;
    /**战力*/
    public static const BATTLE:uint = 4;
    /**深渊*/
    public static const ABYSS:uint = 5;
    /**宝具*/
    public static const BAOJU:uint = 6;
    /**人气*/
    public static const HOT:uint = 7;
    /**灵宠*/
    public static const PET:uint = 8;
    /**
     * 玩家名
     */
    public var playerName:String = "";
    /**平台编号,0x01:蓝钻,0x02,黄钻*/
    public var platform:uint = 0;
    /**
     * 等级
     */
    public var level:uint = 0;
    /**
     * 所属国家
     */
    public var country:uint = 0;
    /**
     * 数值,
     * 荣誉榜为荣誉值,
     * 等级榜为经验,
     * 富豪榜为铜钱,
     * 战机榜为战功,
     * 宗族榜为(宗族等级<<24+人数)
     */
    public var value:Number = 0;
    /**
     * 宗族名
     */
    public var clanName:String = "";

    public var item:ItemStruct;

    public var index:uint;

    public var pet:PetStruct;

    public function SortItemStruct() {
    }
}
}