/**
 * 一定要早点和后台定协议！！！
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-11下午12:13:47
 */
package net.data.structs.clan {
import com.hurlant.math.BigInteger;

public class CcBattleStruct {
    public var playerId:BigInteger;
    public var monsterIndex:int;
    public var result:int;//1.玩家胜利2.怪物胜利0xFF.仙蕴石被攻击
    public var skillType:int;
    public var remainHp:int;

    public var spotId:int;
    public var label:int;
    public var monsterId:int;

  
}
}