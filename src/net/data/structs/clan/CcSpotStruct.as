/**
 * 数据都放在根vo里，视图都放在根view里。
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-10上午10:28:14
 */
package net.data.structs.clan {
import com.hurlant.math.BigInteger;

public class CcSpotStruct {
    public var spotId:int;//玄武：1，青龙：17，白虎：33，朱雀：49，刷新点：255
    public var spotMaxPlayer:int;
    public var bufferType:int;
    public var bufferValue:int;
    public var playerList:Array;
    public var monsterList:Array;
    public var battleList:Array;


    public function get livePlayerList():Array {
        var list:Array = new Array();
        for each (var player:CcPlayerStruct in playerList) {
            if (player.deadType == 0 || player.deadType == 3) {
                list.push(player);
            }
        }
        return list;
    }

    public function getPlayer(playerId:BigInteger):CcPlayerStruct {
        for each (var playerStruct:CcPlayerStruct in playerList) {
            if (playerStruct.playerId.equals(playerId)) {
                return playerStruct;
            }
        }
        return null;
    }

    public function getBattleByMonsterIndex(index:int):CcBattleStruct {
        for each (var battle:CcBattleStruct in battleList) {
            if (battle.monsterIndex == index) {
                return battle;
            }
        }
        return null;
    }

    public function getMonsterByIndex(index:int):CcMonsterStruct {
        for each (var monster:CcMonsterStruct in monsterList) {
            if (monster.monsterIndex == index) {
                return monster;
            }
        }
        return null;
    }

    public function get spotMonsterList():Array {
        var list:Array = new Array();
        for each (var monster:CcMonsterStruct in monsterList) {
            if (((monster.nextSpotId == spotId && monster.isDead != 1) || monster.isDead == 2) && monster.isDead != 0xFF) {
                list.push(monster);
            }
        }
        return list;
    }

    public function get normalBattleList():Array {
        var list:Array = new Array();
        for each (var battle:CcBattleStruct in battleList) {
            if (battle.result != 0xFF) {
                list.push(battle);
            }
        }
        return list;
    }

    public function get homeBattleList():Array {
        var list:Array = new Array();
        for each (var battle:CcBattleStruct in battleList) {
            if (battle.result == 0xFF) {
                list.push(battle);
            }
        }
        return list;
    }
}
}