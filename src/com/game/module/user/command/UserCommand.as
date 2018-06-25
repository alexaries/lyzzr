/**
 * Created by dingcj on 2017/8/19.
 */
package com.game.module.user.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.user.proxy.UserProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class UserCommand extends BaseCommand implements ICommand {

    public function UserCommand() {
    }

    override public function execute(notification:INotification):void {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (notification.getName()) {
            case MsgEvent.BE_DISCONNECT:
                userProxy.beDisconnected();
                break;
        }
    }

}
}
