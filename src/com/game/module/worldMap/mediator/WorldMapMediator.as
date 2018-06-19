/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.worldMap.mediator {

import com.game.common.mvc.BaseMediator;
import com.game.module.worldMap.view.WorldMapView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class WorldMapMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "WorldMapMediator";

    private function get view():WorldMapView {
        return getViewComponent() as WorldMapView;
    }

    public function WorldMapMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(onInstanceComplete);
    }

    private function onInstanceComplete():void {
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
        }
    }
}
}