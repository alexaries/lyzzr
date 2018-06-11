/**
 * Created by huangcb on 2017/8/22.
 */
package com.game.module.map.view {
import com.component.MovieClipCustom;
import com.game.common.view.BaseView;
import com.game.module.battle.model.FfClipName;
import com.game.module.battle.view.FfAutoHideBuff;
import com.signal.SignalDispatcher;



import laya.display.Sprite;
import laya.maths.Point;
import laya.net.Loader;

import net.consts.StaticConfig;

import utils.MathUtil;

public class Player  extends  Sprite{

    public  var moveStartDispatcher:SignalDispatcher
    public  var moveOverDispatcher:SignalDispatcher;

    public static const MOVE_OVER:String = "moveOver";
    public static const MOVE_START:String = "moveStart";
    public static const MOVE_NODE:String = "moveNode";

    public static const STATE_DEFAULT:String = "state_default";
    public static const STATE_FIGHT:String = "state_fight";
    public static const STATE_GATHER:String = "state_gather";

    private static const DELAY:int = 50;
    private var _radians:Number;	//人物移动时的弧度
    private var _degrees:int=1;		//人物移动时的角度

    private var _path:Array = [];
    private var _count:uint = 0;
    private var _state:String = STATE_DEFAULT;
    private var humanLoader:MovieClipCustom;
    private var rideLoader:MovieClipCustom;
    private var charmLoader:MovieClipCustom; //符咒
    private var _moveDis:int =8;
    private var goPoint:Point;
    private var _currPoint:Point;
    private var _humanSource:String;
    private var _rideSource:String;
    private var _charmSource:String;
    private var goPointList:Array;
    var timer_running:Boolean;

    public function Player() {
        super ();
        moveStartDispatcher=new SignalDispatcher();
        moveOverDispatcher=new SignalDispatcher();
        if (!rideLoader) {
            rideLoader = new MovieClipCustom();
            addChild(rideLoader);
            //todo
        }
        if (!humanLoader) {
            humanLoader = new MovieClipCustom();
            humanLoader.scale(1.2,1.2)
            addChild(humanLoader);
            //todo
        }
        if (!charmLoader) {
            charmLoader = new MovieClipCustom();
            addChild(charmLoader);

        }


    }

    private function timerHandler():void {

        if (_path.length > 0) {
            var tempPoint:Point = _path.pop();
            this.x = tempPoint.x;
            this.y = tempPoint.y;
        }
        else {
            if (goPointList.length > 0) {
                goPoint = goPointList.shift();
                var sp:Point = new Point(x, y);
                var ep:Point = goPoint;
                interpolatePath(sp,ep);

            } else {
                end();

            }
        }
    }
    function  interpolatePath( sp:Point, ep:Point):void{
        var len:uint = sp.distance(ep.x, ep.y);
        _count = len / _moveDis;
        _path = [];


        _path.push(ep);
        for (var i:uint = 0; i < _count; i++) {
            var pp =interpolate(ep, sp, i / _count);
            _path.push(pp);
        }
        _radians = MathUtil.getMoveRadians(new Point(x, y), goPoint);
        _degrees = MathUtil.getMoveDegrees(new Point(x, y), goPoint);
        setDirection();
    }

    // Static methods:
    public static function interpolate(a:Point, b:Point, f:Number):Point {
        return new Point(a.x + f * (b.x - a.x), a.y + f * (b.y - a.y));
    }
    public function setHumanSource(value:String):void {
        if (value == _humanSource) return;
        _humanSource = value;
        humanLoader.loadAtlas(StaticConfig.fightAvatarsUrl,_humanSource,true);
        humanLoader.gotoAndPlay(FfClipName.fly+"z",true);
    }

    public function setRideSource(value:String):void {
        if (value == _rideSource) return;
        _rideSource = value;

    }

    public function setCharmSource(value:String):void {
        if (value == _charmSource) return;
        _charmSource = value;

    }

    private function setDirection():void {
        roleSetDirection();
        rideSetDirection();
        charmSetDirection();

    }

    private function roleSetDirection():void {
        if(_degrees>0){
            if(humanLoader.currentFrameLabel!=FfClipName.fly+"z"){
                humanLoader.gotoAndPlay(FfClipName.fly+"z",true);
            }
        }else
        {
            if(humanLoader.currentFrameLabel!=FfClipName.fly+"b"){
                humanLoader.gotoAndPlay(FfClipName.fly+"b",true);
            }
        }
    }

    private function rideSetDirection():void {
    }

    private function charmSetDirection():void {
    }

    //设置人角角度
    public function setPlayerDegress(value:uint):void {
        _degrees = value;
        setDirection();
    }

    public function set state(value:String):void {
        _state = value;
        setDirection();
    }

    public function set moveDis(value:int):void {
        _moveDis = value;
    }


    public function stop():void {
        trace("player stop");
        timer_running = false;
        clearTimer(this, timerHandler);
        setDirection();
    }

    public function end():void {
        var endPoint:Point;

        if (goPointList.length == 0) {
            if (goPoint != null) {
                endPoint = goPoint;
            } else {
                return;
            }
        } else {
            endPoint = goPointList[goPointList.length - 1];
        }
        trunPoint(endPoint);
        stop();
        moveOverDispatcher.dispatch(null);
    }

    public function trunPoint(point:Point):void {
        stop();
        trace("trunPoint",point)
        _currPoint = point;
        x = point.x;
        y = point.y;

    }

    public function go(list:Object):void {
        if (list is Point) {
            goPointList = [list];
        } else if (list is Array) {
            goPointList = list as Array;
        } else {
            return;
        }

        if (!timer_running) {
            timer_running=true;
            timerLoop(33,this, timerHandler)
            //todo
            moveStartDispatcher.dispatch(null);
        }

        goPoint = goPointList.shift();
        var sp:Point = new Point(x, y);
        var ep:Point = goPoint;
        interpolatePath(sp,ep);
    }

    public function get running():Boolean {
        return timer_running;
    }


    public function get currPoint():Point {
        return _currPoint;
    }


}
}