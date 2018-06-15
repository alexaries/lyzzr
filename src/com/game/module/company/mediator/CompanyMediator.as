/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.company.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.company.view.CompanyView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class CompanyMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CompanyMediator";

    private function get view():CompanyView {
        return getViewComponent() as CompanyView;
    };
    public function CompanyMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {
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