/**
 * Created by huangcb on 2017/8/22.
 */
package com.game.module.map.command {

import com.game.module.map.proxy.MapService;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class MapCommand extends BaseCommand implements ICommand {
    public function MapCommand() {
    }
    override public function execute(notification:INotification):void {

        var service:MapService=facade.retrieveProxy(MapService.NAME) as MapService;
        trace(notification)

        switch(notification.getName()) {
            case MsgEvent.MAP_TRANSPORT:
              //  service.mapNpcData(notification.getBody());
                break;
            case MsgEvent.CITY_INSIDE_MOVE:
                service.cityInsideUpdate(notification.getBody());
                break;
            case MsgEvent.MAP_TRANSPORT_UPDATE :
               // service.mapNpcUpdate(notification.getBody());
                break;
            case MsgEvent.MAP_SAMPLEUSER :
              //  service.sampleUserListData(notification.getBody());
                break;
            case MsgEvent.MAP_POINT_JOIN:
             //   service.sampleUserListUpdate(notification.getBody());
                break;
        }
    }
}
}
