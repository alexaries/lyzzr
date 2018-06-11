/**
 * Created by guanll on 2017/9/19.
 */
package com.preset.loading.mediator {
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.proxy.LoadingProxy;
import com.preset.loading.view.LoadingView;
import com.preset.loading.vo.LoadResDefine;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

public class LoadingMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "LoadingMediator";

    private function get view():LoadingView {
        return getViewComponent() as LoadingView;
    };
    public function LoadingMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.startLoad();
        var proxy:LoadingProxy = facade.retrieveProxy(LoadingProxy.NAME) as LoadingProxy;

        proxy.addRes(view.resArray);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [LoadingEvent.SHOW_LOADING_VIEW,LoadingEvent.LOADING_PROGRESS,LoadingEvent.LOADING_END];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        var max:int;
        var left:int;
        var resName:String;

        switch (name) {
            case LoadingEvent.SHOW_LOADING_VIEW:
                max = body.total;
                left = body.left;
                resName = body.curName;
                view.update(max,left,resName);
                view.randomTips = view.getRandomTips();
                trace("LoadingMediator===show==res",body);
                break;
            case LoadingEvent.LOADING_PROGRESS:
                trace("LoadingMediator===body.progress==",body);
                max = body.total;
                left = body.left;
                resName = body.curName;
                view.update(max,left,resName);
                view.progress = body.progress;
                break;
            case LoadingEvent.LOADING_END:
                view.visible = false;
                trace("LoadingMediator===end");
                break;
        }
    }
}
}