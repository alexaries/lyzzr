/**
 * Created by huangcb on 2017/8/15.
 */
package net.command {
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartConnectCommand  extends SimpleCommand implements ICommand
{
    override public function execute(notification:INotification):void
    {
       var socketConnectionProxy:SocketConnectionProxy= facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy ;
        var  addr = notification.getBody()  ;
        socketConnectionProxy.connect(addr.ip,addr.port);
    }
}
}