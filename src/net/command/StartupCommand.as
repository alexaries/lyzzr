/**
 * Created by dingcj on 2018/6/23.
 */
package net.command {
import net.events.ConnectionNotification;
import net.events.HttpNotification;
import net.proxy.HttpConnectionProxy;
import net.proxy.ReHttpProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        facade.registerProxy(new ReHttpProxy());
        facade.registerProxy(new HttpConnectionProxy());
        facade.registerCommand(HttpNotification.MSG, MsgCommand);

        facade.registerCommand(HttpNotification.STARTUP_CONNNECT, StartConnectCommand);
        facade.registerCommand(HttpNotification.CONNECTION, ConnectionCommand);
        facade.registerCommand(ConnectionNotification.CONNECTION_ERROR, ConnectionCommand);
    }
}
}
