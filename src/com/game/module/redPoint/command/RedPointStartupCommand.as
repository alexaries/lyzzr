
/**
 * Created by wangq on 2017/12/26.
 */
package com.game.module.redPoint.command {

import com.game.events.NotiEvent;
import com.game.module.redPoint.proxy.RedPointProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class RedPointStartupCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        trace("RedPointStartupCommand");
        facade.registerProxy(new RedPointProxy());

        facade.registerCommand(NotiEvent.SHOW_REDPOINT, RedPointCommand);  //

        facade.registerCommand(MsgEvent.EXTENSION, RedPointCommand);  //服务端控制 主界面按钮红点
        facade.registerCommand(NotiEvent.SHOW_REDPOINT_MAINICON, RedPointCommand);  //客户端控制主界面按钮红点

    }


}
}

