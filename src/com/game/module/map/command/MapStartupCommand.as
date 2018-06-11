/**
 * Created by huangcb on 2017/8/22.
 */
package com.game.module.map.command {

import com.game.events.NotiEvent;
import com.game.module.map.events.MapServiceEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.user.events.HeroServiceEvent;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class MapStartupCommand extends BaseCommand implements ICommand {
    public function MapStartupCommand() {
    }

    override public function execute(notification:INotification):void {
        trace("MapStartupCommand");
        facade.registerProxy(new MapService());
        facade.registerCommand(NotiEvent.WELCOME_OK, DoHeroListUpdateCommand);
        facade.registerCommand(HeroServiceEvent.HERO_LIST_UPDATE, DoHeroListUpdateCommand);
        facade.registerCommand(MsgEvent.CITY_INSIDE_MOVE, MapCommand);
        return;
        facade.registerCommand(MsgEvent.MAP_TRANSPORT, MapCommand);

        facade.registerCommand(MsgEvent.MAP_TRANSPORT_UPDATE, MapCommand);
        facade.registerCommand(MsgEvent.MAP_SAMPLEUSER, MapCommand);
        facade.registerCommand(MsgEvent.MAP_POINT_JOIN, MapCommand);


        facade.registerCommand(MapServiceEvent.MAP_ARRIVED_BUILD, MapArriveBuildCommand);
        facade.registerCommand(NotiEvent.ARRIVE_BUILD, MapArrivedBuildCommand);

        facade.registerCommand(NotiEvent.PLAYER_MOVE_START, MapOperationCommand);

    }
}
}
