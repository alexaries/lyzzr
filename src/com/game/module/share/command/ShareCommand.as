/**
 * Created by guanll on 2018/1/17.
 */
package com.game.module.share.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.share.event.ShareEvent;
import com.game.module.share.proxy.ShareProxy;

import net.data.recvMsg.active.ActivityAllMsg;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class ShareCommand extends BaseCommand implements ICommand {
    public function ShareCommand() {
    }

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var proxy:ShareProxy=facade.retrieveProxy(ShareProxy.NAME) as ShareProxy;

        switch(name)
        {
            case MsgEvent.ACTIVITY_SEVEN:
                proxy.getInfoFromServer(body as ActivityAllMsg);//ActivityAllMsg
                break;
            case ShareEvent.SHARE_SUCCESS:
                proxy.sendInfoCmd(0);
                break;
            case ShareEvent.SHARE_GET_PRIZE:
                proxy.sendInfoCmd(1);
                break;
            case ShareEvent.CONCERN_SUCCESS:
                proxy.sendInfoCmd(2);
                break;
            case ShareEvent.CONCERN_GET_PRIZE:
                proxy.sendInfoCmd(3);
                break;
            case ShareEvent.GET_INFO:
                proxy.sendInfoCmd(4);
                break;
        }
    }
}
}

