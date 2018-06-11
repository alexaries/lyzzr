package com.game.common.view {
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.vo.LoadResDefine;
import com.signal.SignalDispatcher;

import laya.display.*;
import laya.ui.Component;
import laya.utils.Handler;

import net.consts.AppConst;

import org.puremvc.as3.patterns.facade.Facade;
import com.game.common.mvc.BaseMediator;

import utils.ArrayUtil;

public class BaseView extends Sprite {
    public var onCompleteSignal:SignalDispatcher;
    public var onDisposeSignal:SignalDispatcher;
    public var onVisibleSignal:SignalDispatcher;
    var isTryDispose:Boolean = false;
    protected var isDispose:Boolean = false;
    var isInit:Boolean = false;
    protected var isComplete:Boolean = false;
    var mediator:BaseMediator;
    protected var onlyHide:Boolean;
    var resDefine:LoadResDefine;
    public function BaseView(resArray:Array = null) {
        super();
        onCompleteSignal = new SignalDispatcher();
        onDisposeSignal = new SignalDispatcher();
        onVisibleSignal = new SignalDispatcher();
        if (resArray == null || resArray.length == 0) {
            timer.callLater(this,   $onComplete);
        }
        else {
            //            Laya.loader.load(resArray, Handler.create(this, $onComplete), null);
            timer.callLater(this,  loadRes,[resArray]);
        }
    }

    public  function  center(){
        x = AppConst.width/2- width/2;
        y = AppConst.height/2- height/2;
    }
    /* 子类重写该方法 默认加载需要加载条 否则使用laya自带的load直接加载 不会显示加载条 */
//    protected var resArr:Array;
    protected function loadRes(res:Array):void {
//        Laya.loader.load(res,Handler.create(this,$onComplete),null);
        var resName:String = res.shift()+"正在加载中……";
        resDefine = new LoadResDefine(res, resName, Handler.create(this, $onComplete));
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, resDefine));
//        resArr = resDefine.resArray;
    }

    public function removeRes():void {
        if(resDefine!=null)
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_REMOVE, resDefine));

        resDefine=null;
    }
    override public function set visible(value:Boolean):void {
        super.visible = value;
        onVisibleSignal.dispatch(value);
    }

    public function show():void {
        visible = true;
    }

    public function hide():void {
        visible = false;
        if (isTryDispose) {
            if (onlyHide) {
                isTryDispose = false;
            }
        }
    }

    public function getView() {
        return mediator.getViewComponent();
    }

    public function getMediator():BaseMediator {
        return null;
    }

    public function $onComplete():void {
        if (isInit) return;
        isInit = true;

        onComplete();
        isComplete = true;
        if (isTryDispose) {
            if (onlyHide) {
                hide();
                return;
            }
            $$dispose();
            return;
        }
    }

    public function onComplete():void {
        mediator = getMediator();
        Facade.getInstance().registerMediator(mediator);
        if (onCompleteSignal)onCompleteSignal.dispatch(getView());
    }

    public function tryDispose():void {
        if (isTryDispose)return;
        isTryDispose = true;
        if (isInit == false)return;
        if (onlyHide) {
            hide();
            return;
        }
        dispose();
//        if(resArr && resArr.length > 0){
//            resArr = ArrayUtil.filter(resArr,function(obj:Object):Boolean{
//                Laya.loader.clearRes(obj.url,true);
//                return false;
//            });
//        }
    }

    public function dispose():void {

        $$dispose();

    }

    protected function $$dispose():void {
        if (isDispose)return;
        isDispose = true;
        if (mediator != null)
            Facade.getInstance().removeMediator(mediator.getMediatorName());
        removeRes();
        onDisposeSignal.dispatch(null);
        onCompleteSignal.dispose();
        onDisposeSignal.dispose();
        onVisibleSignal.dispose();
        onCompleteSignal = null;
        onDisposeSignal = null;
        onVisibleSignal = null;
        mediator = null;
        destroy(true);
    }


}
}
