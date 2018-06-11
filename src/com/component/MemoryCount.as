/**
 * Created by huangcb on 2017/10/26.
 */
package com.component {
import utils.TimerUtil;

public class MemoryCount {
    private var _count:int;
    public var activeTime:Number
    public var name:String;
    public var countStr:String;
    public function MemoryCount() {
        _count=0;
    }

    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
        activeTime=TimerUtil.getTimer();
        countStr=count+"";
    }
}
}
