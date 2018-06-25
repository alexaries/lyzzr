/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.command {

import com.game.module.copy.events.CopyEvent;
import com.game.module.copy.proxy.CopyProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class CopyCommand extends SimpleCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var proxy:CopyProxy = facade.retrieveProxy(CopyProxy.NAME) as CopyProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case CopyEvent.COPY_REQUEST_INFO:
                proxy.requestInfo();
                break;
            case MsgEvent.COPY_INFO:
                proxy.onResponseInfo();
                break;
        }
    }
}
}
