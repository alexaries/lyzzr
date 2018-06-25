/**
 * Created by dingcj on 2018/6/23.
 */
package net.command {

import net.proxy.ReHttpProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class MsgCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        //bytes 在这里解释后 再丢出去
        var reHttpProxy:ReHttpProxy = facade.retrieveProxy(ReHttpProxy.NAME) as ReHttpProxy;
        var jsonData:JSON = notification.getBody() as JSON;
        reHttpProxy.parse(notification.getType(), jsonData);
    }
}
}