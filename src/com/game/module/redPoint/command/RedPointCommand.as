/**
 * Created by wangq on 2017/12/26.
 */
package com.game.module.redPoint.command {
import com.game.events.NotiEvent;
import com.game.module.redPoint.proxy.RedPointProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

import utils.ByteArray;

public class RedPointCommand extends BaseCommand implements ICommand {



    private var pointProxy:RedPointProxy;
    override public function execute(notification:INotification):void {
        pointProxy = facade.retrieveProxy(RedPointProxy.NAME) as RedPointProxy;


        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case NotiEvent.SHOW_REDPOINT:
                pointProxy.redPointNotice(body[0],body[1],body[2],body[3]);
                break;
            case MsgEvent.EXTENSION:
                pointProxy.getRedPointInfo(body as ByteArray);
                break;
            case NotiEvent.SHOW_REDPOINT_MAINICON:
                pointProxy.getRedPointInfoByClient(body as Array);
                break;


        }
    }



}
}

