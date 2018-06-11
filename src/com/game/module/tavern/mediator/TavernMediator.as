/**
 * Created by dingcj on 2018/5/15.
 */
package com.game.module.tavern.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.menu.events.MenuEvent;
import com.game.module.tavern.view.TavernView;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class TavernMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TavernMediator";

    private function get view():TavernView {
        return getViewComponent() as TavernView;
    };
    public function TavernMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        view.tuSignal.getSignal(this).listen(tuClick);
        view.oneSignal.getSignal(this).listen(oneClick);
        view.tenSignal.getSignal(this).listen(tenClick);
    }

    private function tuClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_TU_VIEW, MenuWindowVO.OPEN)));
    }

    private function tenClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_HIRE_VIEW, MenuWindowVO.OPEN)));
    }

    private function oneClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_HIRE_VIEW, MenuWindowVO.OPEN)));
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