/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.company.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.company.view.CompanyView;
import com.game.module.copy.proxy.CopyProxy;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class CompanyMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CompanyMediator";

    private var copyProxy:CopyProxy;

    private function get view():CompanyView {
        return getViewComponent() as CompanyView;
    };
    public function CompanyMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        copyProxy = facade.retrieveProxy(CopyProxy.NAME) as CopyProxy;

        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.closeSignal.getSignal(this).listen(onCloseClick);
        view.ruleSignal.getSignal(this).listen(onRuleClick);
        view.moreSignal.getSignal(this).listen(onMoreClick);
    }

    private function instanceCompleteHander():void {
        dispatch(new Notification(NotiEvent.OPEN_MONEY));
    }

    private function onMoreClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.EXPERT_VIEW, MenuWindowVO.OPEN, false)));
    }

    private function onRuleClick():void {

    }

    private function onCloseClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COMPANY_VIEW, MenuWindowVO.CLOSE)));
    }

    override public function onRemove():void {
        super.onRemove();
        if (copyProxy.isInCopy)dispatch(new Notification(NotiEvent.CLOSE_MONEY));
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