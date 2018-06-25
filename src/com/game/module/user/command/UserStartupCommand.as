/**
 * Created by dingcj on 2018/6/25.
 */
package com.game.module.user.command {

import com.game.common.mvc.BaseCommand;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class UserStartupCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        trace("UserStartupCommand");
        facade.registerCommand(MsgEvent.BE_DISCONNECT, UserCommand);
    }
}
}
