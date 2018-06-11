/**
 * 一定要早点和后台定协议！！！
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-11上午11:36:37
 */
package net.data.structs.clan {
public class CcFightInfo {
    public static const TIME:int = 5;
    public static const MOVE_TIME:int = 5;
    public static const FIGHT_TIME:int = 3;

    public var copyId:int;
    public var copyLevel:int;
    public var maxWaveCount:int;
    public var curWaveCount:int;
    public var homeMaxHp:int;
    public var homeHp:int;
    public var tickCount:int;
    public var spotList:Array;

    public function get tickTime():int {
        return (3 - (tickCount - 1 < 0 ? tickCount - 1 + 3 : tickCount - 1) % 3) * TIME;
    }


    public function getSpot(spotId:int):CcSpotStruct {
        for each (var spotStruct:CcSpotStruct in spotList) {
            if (spotStruct.spotId == spotId) {
                return spotStruct;
            }
        }
        return null;
    }
}
}
