/**
 * Created by huangcb on 2017/8/23.
 */
package com.game.module.map.events {
import org.puremvc.as3.patterns.observer.Notification;

public class MapLoaderEvent  extends  Notification{
    // 场景点击
    public static const ACCESS_SCENE : String = "accessScene";
    // 建筑点击
    public static const ACCESS_BUILD : String = "accessBuild";
    // 城堡点击
    public static const ACCESS_CASTLE : String = "accessCastle";
    // 英雄岛点击
    public static const ACCESS_HEROISLAND : String = "accessHeroisland";
    // 鼠标移到节点上
    public static const NODE_OVER : String = "nodeOver";
    // 鼠标离开节点
    public static const NODE_OUT : String = "nodeOut";
    // 地图下裁完成后触发
    public static const MAP_INIT : String = "swfLoaderMapInit";
    // 地图加载错误
    public static const MAP_LOAD_ERROR : String = "map_load_error";
    public function MapLoaderEvent(type:String,data:Object=null) {
        super(type,data);
    }
}
}
