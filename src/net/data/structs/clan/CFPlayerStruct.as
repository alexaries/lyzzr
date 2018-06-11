package net.data.structs.clan {
import com.hurlant.math.BigInteger;

/**
 * @author ryan
 */
public class CFPlayerStruct {
    public var pid:BigInteger = BigInteger.ZERO;
    public var pname:String = "";
    public var level:int = 60;
    //战场ID
    public var fightID:int = 1;
    //状态 1等待出战 2战斗中 3死亡 4连胜10场禁止战斗
    public var status:int = 1;

    // 头像
    public var playerHead:Number = 2;

}
}
