/**
 * Created by huangcb on 2017/9/6.
 */
package com.game.module.map.command {

import com.game.events.NotiEvent;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class MapArrivedBuildCommand extends BaseCommand implements ICommand {

    //NotiEvent.ARRIVE_BUILD
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var locID : int = body as int;
        var userProxy:UserProxy=facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        userProxy.userData.buildId =locID;

        dispatch(new NotiEvent(NotiEvent.GUIDE_TAB_CHANGE));
    }

}
}
