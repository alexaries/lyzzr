/**
 * Created by huangcb on 2017/11/15.
 */
package com.component {
import utils.ArrayUtil;
import utils.TimerUtil;

public class MovieClipStage {
    private static var __instance: MovieClipStage;
    private var maxPassedTime:Number=0;
    private var curPassedTime:Number=0;
    public static function getInstance():MovieClipStage {
        if (__instance == null) {
            __instance = new MovieClipStage();
        }
        return __instance;
    }
    private var _frameTimestamp:Number;
    public var list:Array=[];
    public function MovieClipStage() {
        curPassedTime=0;
        maxPassedTime=500;
    }

    public function  add(mc:MovieClipCustom):void{
        list.push(mc)
    }
    public function remove(mc:MovieClipCustom):void{
        ArrayUtil.remove(list,mc);
    }
    /** Calls <code>advanceTime()</code> (with the time that has passed since the last frame)
     *  and <code>render()</code>. */
    public function nextFrame():void
    {
        var now:Number = TimerUtil.getTimer() / 1000.0;
        var passedTime:Number = now - _frameTimestamp;
        _frameTimestamp = now;

        // to avoid overloading time-based animations, the maximum delta is truncated.
        if (passedTime > 1.0) passedTime = 1.0;

        // after about 25 days, 'getTimer()' will roll over. A rare event, but still ...
        if (passedTime < 0.0) passedTime = 1.0 / 15;

        advanceTime(passedTime);
    }
    public function advanceTime(passedTime:Number):void {
        list.length>0&&list.forEach(function(mc:MovieClipCustom){
            mc.advanceTime(passedTime);
        })
        curPassedTime+=1;
        if(curPassedTime>maxPassedTime){

            curPassedTime= 0;
        }

    }
}
}
