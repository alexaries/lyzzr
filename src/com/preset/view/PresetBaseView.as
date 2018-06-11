/**
 * Created by huangcb on 2017/11/18.
 */
package com.preset.view {
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.vo.LoadResDefine;

import laya.display.Sprite;
import laya.ui.Component;
import laya.utils.Handler;

import net.consts.AppConst;

import org.puremvc.as3.patterns.facade.Facade;
import org.puremvc.as3.patterns.mediator.Mediator;

public class PresetBaseView extends Sprite {
    protected var mediator:Mediator;
    protected var isDispose:Boolean;
    var resDefine:LoadResDefine;
    public function PresetBaseView(resArray:Array) {
        super();
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
    protected function loadRes(res:Array):void {
//        Laya.loader.load(res,Handler.create(this,$onComplete),null);
        var resName:String = res.shift()+"正在加载中……";
        resDefine = new LoadResDefine(res, resName, Handler.create(this, $onComplete));
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, resDefine));
    }


    protected function $onComplete():void {
        onComplete();
        mediator = getMediator();
        Facade.getInstance().registerMediator(mediator);
    }

    public function getMediator():Mediator {
        return null;
    }

    public function onComplete():void {
    }

    public function dispose():void {
        if (isDispose)return;
        isDispose = true;
        if (mediator != null)
            Facade.getInstance().removeMediator(mediator.getMediatorName());
        if(resDefine!=null)
            Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_REMOVE, resDefine));
        resDefine=null;
        destroy(true);
    }
}
}
