package net.data.structs.heroIsland {
import com.hurlant.math.BigInteger;

/**
 * @author ryan
 */
public class HeroIslandUserStruct {
    public function HeroIslandUserStruct() {

    }

    public var id:BigInteger =BigInteger.nbv(0);
    public var name:String = '';
    public var status:uint = 0;
    public var leftHp:uint = 100;
    public var level:uint = 50;
}
}
