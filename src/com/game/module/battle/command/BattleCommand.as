/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.proxy.BattleProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class BattleCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var proxy:BattleProxy = facade.retrieveProxy(BattleProxy.NAME) as BattleProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case BattleEvent.BATTLE_UPDATE_INFO:

                break;
        }
    }
}
}
