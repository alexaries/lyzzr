package net.data.structs.endwar {
import com.hurlant.math.BigInteger;

public class StaffStruct {
    public function StaffStruct() {

    }

    public var index:uint = 0;
    public var id:BigInteger =  BigInteger.nbv(0);
    public var name:String = '';
    public var clan:String = "";
    //0采集   1充能   2采集人员 3充能人员
    public var status:uint = 0;
    private var _n:uint = 100;
    public var max:uint = 100;
    public var level:uint = 50;


    public function get n():uint {
        return _n;
    }

    public function set n(value:uint):void {
        _n = value;

    }


}
}
