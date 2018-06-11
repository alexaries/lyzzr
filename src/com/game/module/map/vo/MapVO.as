package com.game.module.map.vo {
import com.game.consts.URLConfig;
import com.game.module.map.events.MapEvent;
import com.game.module.map.util.MapUtil;

import net.consts.StaticConfig;

/**
 * @author ryan
 */
public class MapVO {
    //地图swf路径
    private var _mapUrl:String;
    //地图类型,当前是在国家地图还是各城市地图:MapEvent.COUNTRY || MapEvent.CITY
    public var flag:String;
    //如果当前是属于城市节点刚为城市节点ID
    public var nodeId:int;
    //建筑节点的名称,如果当前是属于城市节点刚为城市节点名称
    public var nodeName:String;
    //种族ID
    public var countryId:int;
    //种族名称
    public var countryName:String;
    //城市ID
    public var cityId:int;
    //城市名称
    public var cityName:String;
    //节点类型,即xml.@type
    public var type:int;
    //解析结果,true为正常,false为错误
    public var result:Boolean = false;
    //是否为自动PK点
    public var isKillState:Boolean = false;


    public function MapVO(__mapmodel:MapModel, nodeId:int = -1, t:int = 1) {
        //从本地 获取数据    初始化  map的数据
        if (nodeId == -1) return;

        this.nodeId = nodeId;

        var cityvo:CityBaseInfoVO = MapUtil.getCityBaseInfoVObyId(__mapmodel, nodeId, t);
        if (!cityvo) return;

        switch (cityvo.type) {
            case 1:
                flag = MapEvent.CITY;
                break;
            case 0:
                flag = MapEvent.COUNTRY;
                break;
            case 2:
                flag = MapEvent.CASTLE;
                break;
            case 3:
                flag = MapEvent.HEROISLAND;
                break;
        }

        cityId = cityvo.id;
        cityName = cityvo.name;
        mapUrl = cityvo.map;
        type = t;

    }

    public function getMapUrl(level:int):String {
        var mapUrl:String = _mapUrl;
        var arr:Array;
        // 新地图
        if (StaticConfig.skinVersion == 1) {
            arr = _mapUrl.split("/");
            arr[0] = "new_maps";
            mapUrl = arr.join("/");
        }
        if (level > 0) {
            switch (URLConfig.skin) {
                case 0:
                    arr = _mapUrl.split("/");
                    arr[0] = "new_maps";
                    mapUrl = arr.join("/");
                    break;
                case 1:
                    arr = _mapUrl.split("/");
                    arr[0] = "map";
                    mapUrl = arr.join("/");
                    break;
            }
        }
        return StaticConfig.httpServer + mapUrl;
//			return StaticConfig.httpServer+_mapUrl;
    }

    public function set mapUrl(value:String):void {
        _mapUrl = value;
    }

    public function get mapUrl():String {
        return _mapUrl;
    }
}
}
