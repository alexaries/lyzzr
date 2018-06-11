package net.data.structs.strongRoad {
/**
 */
public class ChestsStruct {
    public var id:uint;
    public var value:uint = 0;//在线时间或者消费银币礼券仙石数

    public var time:uint;
    public var items:Array = [];
    private var _got:Boolean;


    public function get got():Boolean {
        for (var i:uint = 0; i < items.length; i++) {
            if (items[i] == 0)
                return false;
        }
        return true;
    }


}
}
