/**
 * 数据都放在根vo里，视图都放在根view里。
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-10上午10:26:12
 */
package net.data.structs.clan {
import com.hurlant.math.BigInteger;

public class CcBaseInfo {
    public var copyLevel:int;
    public var spotList:Array;

    public function getPlayerById(id:BigInteger):CcPlayerStruct {
        for each (var spotStruct:CcSpotStruct in spotList) {
            for each (var playerStruct:CcPlayerStruct in spotStruct.playerList) {
                if (id.equals(playerStruct.playerId)) {
                    return playerStruct;
                }
            }
        }
        return null;
    }
}
}