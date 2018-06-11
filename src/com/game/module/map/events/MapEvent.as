package com.game.module.map.events {
import org.puremvc.as3.patterns.observer.Notification;

public class MapEvent extends Notification {

    public static const NODE_LIST:String = "nodeList";	//节点列表
    public static const COUNTRY:String = "country";
    public static const CITY:String = "city";
    public static const CASTLE:String = "castle";
    public static const WORLD:String = "world";
    public static const HEROISLAND:String = "heroisland";//英雄岛
    public static const WORLD_DOT:String = "worldDot";

    private var _flag:String;
    public function get flag():String {
        return _flag;
    }

    public function MapEvent(type:String, data:Object = null, flag:String = null) {
        super(type, data, flag);
        _data = data;
        _flag = flag;
    }

    private var _data:Object;

    public function get data():Object {
        return _data;
    }

    public function set data(value:Object):void {
        _data = value;
    }

}
}