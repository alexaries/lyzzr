/**
 * 一定要早点和后台定协议！！！
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-11上午11:53:40
 */
package net.data.structs.clan {
public class CcMonsterStruct {
    public var monsterIndex:int;
    public var monsterId:int;
    public var monsterType:int;//普通：0，精英：1：boss：2
    public var monsterValue:int;
    public var nextSpotId:int;//玄武：1，青龙：17，白虎：33，朱雀：49，刷新点：255
    public var isDead:int;//0：没死，1：死了，2：战斗中，0xFF：攻击仙蕴石

    public var label:int;
    public var spotId:int;
    public var posId:int;
    public var nextPosId:int;


}
}