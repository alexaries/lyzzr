/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.proxy.BattleProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class BattleStartUpCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        trace("BattleStartUpCommand");
        facade.registerProxy(new BattleProxy());
        facade.registerCommand(BattleEvent.BATTLE_UPDATE_INFO, BattleCommand);
    }
}
}
