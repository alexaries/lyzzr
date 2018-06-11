/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.command {

import com.game.module.copy.events.CopyEvent;
import com.game.module.copy.proxy.CopyProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class CopyStartUpCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        trace("TavernStartUpCommand");
        facade.registerProxy(new CopyProxy());
        facade.registerCommand(CopyEvent.COPY_REQUEST_INFO, CopyCommand);
    }
}
}
