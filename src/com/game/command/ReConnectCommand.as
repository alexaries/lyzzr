/**
 * Created by guanll on 2017/11/8.
 */
package com.game.command {
import net.data.recvMsg.ReConnectionMsg;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class ReConnectCommand extends BaseCommand implements ICommand {
    private var socketConnectionProxy:SocketConnectionProxy= facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy ;
    override public function execute(notification:INotification):void {
        trace("ReConnectCommand");
        var msg:ReConnectionMsg = notification.getBody() as ReConnectionMsg;
        switch (msg.getFlag()) {
            case 0:
                //重连 成功
              ///  socketConnectionProxy.isReConnect = false;
                break;
        }
    }
}
}
