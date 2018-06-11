/**
 * 数据都放在根vo里，视图都放在根view里。
 * @作者 罗单可
 * @QQ 514212314
 * @版本 1.0.0
 * @时间 2012-9-10上午10:31:18
 */
package net.data.structs.clan {
import com.hurlant.math.BigInteger;

public class CcPlayerStruct {
    public var playerIndex:int;
    public var playerId:BigInteger;
    public var playerName:String;
    public var playerLevel:int;
    public var deadType:int;//0：没死，1：死了，2：逃了，3：战斗中
    public var skillType:int = 1;

    public var label:int;
    public var spotId:int;


}
}