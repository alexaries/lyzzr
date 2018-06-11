package com.game.module.map.events {
import org.puremvc.as3.patterns.observer.Notification;

/**
 * 操作MapModule UI 界面消息
 * @author ryan
 */
public class MapOperatorEvent extends Notification {

    public static const INIT:String = "init";
    public static const MAP_INIT:String = "map_init";
    public static const MAP_AUTO_RUN:String = "map_auto_run";
    public static const DELIVER_NO_MONEY:String = "deliver_no_money";
    public static const STOP_AUTO_RUN:String = "stop_auto_run";
    public static const DELIVER:String = "deliver";
    public static const MAP_ENTER_BUILD_HANDLE:String = "map_enter_build_handle";
    public static const ARRIVED_BUILD:String = "arrived_build";
    public static const PLAYER_MOVE_START:String = "player_move_start";
    public static const ACCESS_BUILD:String = "ACCESS_BUILD";

    public static const ARRIVED_HEROISLAND:String = "arrived_heroisland";
    public static const MAP_ENTER_HEROISLAND_HANDLE:String = "map_enter_heroisland_handle";

    public static const ARRIVED_BUILD_OPEN:String = "arrived_build_open";
    public function MapOperatorEvent(type:String, _data:* = null) {

        super(type, _data);
    }
}
}
