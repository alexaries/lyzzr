/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.user.command {

import com.game.events.NotiEvent;
import com.game.module.activity.proxy.ActivityService;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class ActivityInfoCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var proxy:ActivityService = facade.retrieveProxy(ActivityService.NAME) as ActivityService;
        switch (name) {
            case MsgEvent.GET_TIME:
                proxy.serverTimeHandle(body)
                break;
            case NotiEvent.ACTIVITY_COMMAND:
                var arr:Array=body as Array
                if (arr[0]==0x05){
                    proxy.sendXmasCmd(body);

                }else{
                    proxy.sendTanabateCmd(body);
                }
                break;
            case NotiEvent.REQ_SYS_SERVER_TIME:
                proxy.reqSysServerTime(body as int);
                break;
        }
    }
}
}
