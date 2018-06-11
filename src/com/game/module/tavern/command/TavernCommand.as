/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.tavern.events.TavernEvent;
import com.game.module.tavern.proxy.TavernProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TavernCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        var proxy:TavernProxy = facade.retrieveProxy(TavernProxy.NAME) as TavernProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case TavernEvent.TAVERN_REQUEST_INFO:

                break;
        }
    }
}
}
