/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.menu.events.MenuEvent;
import com.game.module.tavern.view.HeroDisplayView;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class HeroDisplayMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "HeroDisplayMediator";

    private function get view():HeroDisplayView {
        return getViewComponent() as HeroDisplayView;
    };
    public function HeroDisplayMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        view.closeSignal.getSignal(this).listen(closeClick);
    }

    private function closeClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_HIRE_VIEW, MenuWindowVO.CLOSE)));
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.HERO_DISPLAY_VIEW, MenuWindowVO.CLOSE)));
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