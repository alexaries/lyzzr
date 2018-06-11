package com.game.module.task.vo {
import net.data.recvMsg.task.TaskCycFreshVOMsg;

/**
 * @author john
 */
public class TaskCycVo {
    public var cyc:uint = 0;
    public var refreshCount:uint;
    public var finishCount:uint;
    public var leftCount:uint;
    public var tasks:Array;
    public var vipCfgs:Array;
    public var isAuto:Boolean = false;
    public var color:uint = 2;
    private var _num:uint = 0;
    public var cost:uint = 5;
    public var maxCount:Number = 0;
    public var flag:Boolean;
    public var isPswdCreate:Boolean;
    public var isPswdLock:Boolean ;
    public var gold:int;//用户的钱

    public function set num(n:uint):void {
        if (n > maxCount) n = maxCount;
        _num = n;
    }

    public function get num():uint {
        return _num;
    }

    public function get useGold():uint {
        return num * cost;
    }

    public function setMaxCount(gold:int):void {
        maxCount = gold / cost;
    }

    public function get best():uint {
        var task:Object;
        var b:uint = 0;
        var c:uint;
        for (var i:uint = 0; i < tasks.length; i++) {
            task = tasks[0];
            b =  Math.floor(task["color"]);
            if (b < c) {
                b = c;
            }
        }
        return b;
    }
}
}
