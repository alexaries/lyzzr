/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.common.mediator {
import com.game.common.events.MoneyEvent;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.MoneyView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class MoneyMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MoneyMediator";
    private static var maxTiLi:int = 100;

    private function get view():MoneyView {
        return getViewComponent() as MoneyView;
    };

    public function MoneyMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);

        view.tiSignal.getSignal(this).listen(onTiClick);
        view.jinSignal.getSignal(this).listen(onJinClick);
        view.zuanSignal.getSignal(this).listen(onZuanClick);
    }

    private function onZuanClick():void {
        //前往添加钻石
    }

    private function onJinClick():void {
        //前往添加金币
    }

    private function onTiClick():void {
        //前往添加体力
    }

    private function instanceCompleteHander():void {
        updateMoney();
    }

    private function updateMoney():void {

    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            MoneyEvent.UPDATE_TILI_VALUE,
            MoneyEvent.UPDATE_JINBI_VALUE,
            MoneyEvent.UPDATE_ZUANSHI_VALUE
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var value:int = body as int;
        switch (name) {
            case MoneyEvent.UPDATE_TILI_VALUE:
                view.updateTiLi(value, maxTiLi);
                break;
            case MoneyEvent.UPDATE_JINBI_VALUE:
                view.updateJinBi(value);
                break;
            case MoneyEvent.UPDATE_ZUANSHI_VALUE:
                view.updateZuanShi(value);
                break;
        }
    }
}
}