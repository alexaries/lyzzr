/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.module.company.view.CompanyEditorView;

import lang.SystemInfo;

import laya.utils.Handler;

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
        view.sureSignal.getSignal(this).listen(onSureClick);
    }

    private function onSureClick():void {
        Alert.show("确定修改？确认后不能随意修改公司名", "提示", [SystemInfo.OK, SystemInfo.CANCEL], Handler.create(this, function (type:String) {
            if (type == "ok") {
                view.hide();
            }
            else if (type == "cancel") {
                view.hide();
            }
        }, null, false));
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