/**
 * Created by huangcb on 2017/8/16.
 */
package net.command {

import net.data.recvMsg.CheckIDMsg;
import net.data.recvMsg.LoginMsg;
import net.data.recvMsg.user.SysAlertMsg;
import net.events.MsgEvent;
import net.proxy.ReMapProxy;
import net.utils.MsgCenter;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;
import org.puremvc.as3.patterns.facade.Facade;

import utils.ByteArray;

public class MsgCommand  extends SimpleCommand implements ICommand
{
    override public function execute(notification:INotification):void
    {
        //bytes 在这里解释后 再丢出去
        var reMapProxy:ReMapProxy= facade.retrieveProxy(ReMapProxy.NAME) as ReMapProxy ;
        var msgData:ByteArray=notification.getBody() as ByteArray;
        reMapProxy.parse(notification.getType(),msgData);


    }
}
}