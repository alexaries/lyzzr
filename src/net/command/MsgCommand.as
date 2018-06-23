/**
 * Created by dingcj on 2018/6/23.
 */
package net.command {

import net.proxy.ReMapProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

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