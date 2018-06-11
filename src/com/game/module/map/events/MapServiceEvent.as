package com.game.module.map.events {

import org.puremvc.as3.patterns.observer.Notification;

/**
 * 来自MapService服务消息
 * @author ryan
 */
public class MapServiceEvent extends Notification {
    public static const USER_LIST_UPDATE:String = "USER_LIST_UPDATE";


    public static const PLAYER_SPEED_CHANGE:String = "player_speed_change";		//
    public static const PLAYER_SOURCE_CHANGE:String = "player_source_change";		//
    public static const MAP_ARRIVED_BUILD:String = "map_arrived_build";			//

    public function MapServiceEvent( name:String, body:Object=null ){
        super(name,body );
    }
}
}
