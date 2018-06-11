/**
 * Created by guanll on 2018/1/17.
 */
package com.game.module.share.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.share.event.ShareEvent;
import com.game.module.share.proxy.ShareProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class ShareStartupCommand extends BaseCommand implements ICommand {
    public function ShareStartupCommand() {
    }

    override public function execute(notification:INotification):void {
        facade.registerProxy(new ShareProxy());
        facade.registerCommand(MsgEvent.ACTIVITY_SEVEN, ShareCommand);

        facade.registerCommand(ShareEvent.SHARE_SUCCESS, ShareCommand);
        facade.registerCommand(ShareEvent.SHARE_GET_PRIZE, ShareCommand);
        facade.registerCommand(ShareEvent.CONCERN_SUCCESS, ShareCommand);
        facade.registerCommand(ShareEvent.CONCERN_GET_PRIZE, ShareCommand);
        facade.registerCommand(ShareEvent.GET_INFO, ShareCommand);

    }
}
}

