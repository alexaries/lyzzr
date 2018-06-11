/**
 * Created by huangcb on 2017/8/15.
 */
package net.command {
import net.events.ConnectionNotification;
import net.events.SocketNotification;
import net.mediator.SocketConnectionMediator;
import net.proxy.ReMapProxy;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand implements ICommand
{
    override public function execute(notification:INotification):void
    {
        facade.registerProxy( new ReMapProxy() );
        facade.registerProxy( new SocketConnectionProxy());
        facade.registerCommand(SocketNotification.STARTUP_CONNECT,StartConnectCommand);

        facade.registerCommand(SocketNotification.CONNECTION,ConnectionCommand);
        facade.registerCommand(ConnectionNotification.CONNECTION_ERROR,ConnectionCommand)
        facade.registerCommand(SocketNotification.MSG,MsgCommand);

    }
}
}
