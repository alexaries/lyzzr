/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.company.view.CompanyEditorView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class CompanyEditorMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CompanyEditorMediator";

    private function get view():CompanyEditorView {
        return getViewComponent() as CompanyEditorView;
    };
    public function CompanyEditorMediator(__viewComponent:Object = null) {
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