/**
 * Created by huangcb on 2017/11/17.
 */
package com.component {
import laya.utils.Handler;

public class DownTime {
    var maxTime:int=15 ;
    public var loopTime:int=1000;
    public var downTime:int;
    public var callBack:Handler
    public var done:Handler
    public function DownTime(maxTime:int,callBack:Handler,done:Handler=null) {
       this.downTime= this.maxTime=maxTime;
        this.callBack=callBack;
        this.done=done;
        updateCallBack();
    }

    public  function  start(){
        Laya.stage.timer.loop(loopTime,this,update)
    }
    function  updateCallBack():void{
        if(callBack){
            callBack.runWith(downTime);
        }
    }
    public function update(){
        updateCallBack();
        if(downTime<0){
            if(done)
            done.run();
            stop();

        }
        downTime--;
    }
    public function stop(){
        Laya.stage.timer.clear(this,update)
        if(callBack){
            callBack.clear()
            callBack=null;

        }
        if(done){
            done.clear()
            done=null;
        }

    }
}
}
