package net.data.structs.clan {
import com.hurlant.math.BigInteger;

public class ClanMemberStruct {
    public function ClanMemberStruct() {
    }

    //仙界遗迹的体力值
    public var power:uint;
    public var id:BigInteger = BigInteger.nbv(0);
    public var name:String;
    public var pos:int;
    public var level:int;
    public var flag:int;
    public var proffer:uint;
    public var time:uint;
    public var platform:int;
    public var bindQQ:Boolean;
    /**
     *活跃度
     */
    public var active:uint;
    /**
     *上周活跃度
     */
    public var weekActivePoint:uint;
    /**
     *本月活跃度
     */
    public var monthActivePoint:uint;
}
}