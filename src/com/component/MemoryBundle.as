/**
 * Created by huangcb on 2017/12/13.
 */
package com.component {
import laya.utils.Dictionary;

import utils.TimerUtil;

public class MemoryBundle {
    public var name:String;
    public function MemoryBundle() {
    }
    public var  memory:Dictionary=new Dictionary();
    public var loseTime:Number=1000*60*2;

    public function addLabel(name:String):void {
        if(  memory.get(name)==null){
            var __memoryCount:MemoryCount=new MemoryCount()
            memory.set(name,__memoryCount);
            __memoryCount.name=name;
        }
        var memoryCount:MemoryCount=memory.get(name);
        memoryCount.count=memoryCount.count+1;
        memory.set(name,memoryCount)

        //trace("addLabel",name)
    }

    public  function removeLabel(name:String):void {
        var memoryCount:MemoryCount=memory.get(name);
        memoryCount.count=memoryCount.count-1;
        memory.set(name,memoryCount)

       //trace("removeLabel",name)
    }
    public   function  debug():void {

        clear();

        trace("#####################Memory##################################################################################################")
        trace("memovy.keys.length",memory.keys.length)
        for (var i:int = 0; i < memory.keys.length; i++) {
            var key:String = memory.keys[i];
            var memoryCount:MemoryCount=memory.get(key);
            trace(key,memoryCount.count);
        }
    }

    public function clear():void {
        var tmp:Array = [];
        for (var i:int = 0; i < memory.keys.length; i++) {
            var key:String = memory.keys[i];
            var memoryCount:MemoryCount = memory.get(key);
            if (memoryCount.count == 0 && (TimerUtil.getTimer() - memoryCount.activeTime) > loseTime) {
                trace("clearRes", key);
                tmp.push(key)

            }
        }
        remove(tmp)
    }

    public function clearNow():void {
        var tmp:Array = [];
        for (var i:int = 0; i < memory.keys.length; i++) {
            var key:String = memory.keys[i];
            var memoryCount:MemoryCount = memory.get(key);
            if (memoryCount.count == 0  ) {
                trace("clearRes", key);
                tmp.push(key)

            }
        }
        remove(tmp)
    }
    public function remove(tmp:Array ):void {

    }
}
}
