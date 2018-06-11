package net.data.structs.sort {
/**
 * 玩家自己的排行数据
 */
public class PersonalSortStruct {
    /**排行榜编号,为0时表示没有更新*/
    public var id:uint = 0;
    /**我的战力排名*/
    public var battle:uint = 999;
    /**我的世界等级排名*/
    public var levelW:uint = 999;
    /**我的阵营等级排名*/
    public var levelC:int = 999;
    /**我的世界斗剑排名*/
    public var arenaW:uint = 999;
    /**我的阵营斗剑排名*/
    public var arenaC:int = 999;
    /**我的世界战功排名*/
    public var fightScoreW:uint = 999;
    /**我的阵营战功排名*/
    public var fightScoreC:uint = 999;
    /**我的世界宗族排名*/
    public var clanW:uint = 999;
    /**我的阵营宗族排名*/
    public var clanC:uint = 999;

    /**我的宝具排名*/
    public var baoju:uint = 999;
    /**我的宝具战斗力*/
    public var baojuPow:uint = 999;
    /**我的人气*/
    public var hot:uint = 999;

    public function PersonalSortStruct() {
    }
}
}