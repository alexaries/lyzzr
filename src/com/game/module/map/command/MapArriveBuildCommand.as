/**
 * Created by huangcb on 2017/9/6.
 */
package com.game.module.map.command {

import com.game.events.NotiEvent;
import com.game.module.map.vo.MapVO;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class MapArriveBuildCommand extends BaseCommand implements ICommand {

    //MapServiceEvent.MAP_ARRIVED_BUILD
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var mapvo:MapVO = notification.getBody()[0];
        var userProxy:UserProxy=facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        userProxy.userData.buildId =mapvo.nodeId;
        dispatch(new NotiEvent(NotiEvent.AUTO_MAP_ARRIVE,[mapvo]));
        dispatch(new NotiEvent(NotiEvent.AUTO_MAP_HOOK,[]));
      //  dispatch(new NotiEvent(NotiEvent.GUIDE_TAB_CHANGE));

    }


}
}
