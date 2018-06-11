package net.data.structs.sWar {
import com.hurlant.math.BigInteger;

/**
 * @author ryan
 */
public class SWarP1Struct {
    public var flv:uint = 0;
    public var fpop:uint = 0;
    /**
     *  投注类别<br>
     *    0 - 未投注<br>
     *    1 - 仙石<br>
     *  2 - 银币
     */
    public var tael:uint = 0;
    public var portrait:uint = 0;
    public var color:uint = 0;
    public var countryID:uint = 0;
    public var lv:uint = 0;
    public var fightName:String = "";
    public var fightID:BigInteger;
    public var pos:uint;
    public var group:uint;
}
}
