/**
 * Created by huangcb on 2017/10/19.
 */
package com.game.module.map.mediator {
import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

public class SimplePlayersMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "SimplePlayersMediator";

    private function get view() {
        return getViewComponent();
    };
    public function SimplePlayersMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
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
            case "":
                break;
        }
    }
}
}