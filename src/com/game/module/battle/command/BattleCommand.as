/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseCommand;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.proxy.BattleProxy;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class BattleCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var proxy:BattleProxy = facade.retrieveProxy(BattleProxy.NAME) as BattleProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case BattleEvent.BATTLE_ENTER:
                //请求进入战斗 传入copyId
                var copyId:int = body as int;
                enterBattle(copyId);
                break;
            case BattleEvent.BATTLE_UPDATE_INFO:

                break;
        }
    }

    private function enterBattle(copyId:int):void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.BATTLE_VIEW, MenuWindowVO.CLOSE)));
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.BATTLE_VIEW, MenuWindowVO.OPEN, [copyId])));
    }
}
}
