/**
 * Created by huangcb on 2017/8/22.
 */
package com.game.module.map.mediator {
import com.game.events.NotiEvent;
import com.game.module.citywar.proxy.CityWarProxy;
import com.game.module.citywar.vo.CityWarCityVo;
import com.game.module.citywar.vo.CityWarNodeVo;
import com.game.module.hIsland.events.HIslandServiceEvent;
import com.game.module.hIsland.proxy.HIslandService;
import com.game.module.map.events.MapEvent;
import com.game.module.map.events.MapLoaderEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.util.MapUtil;
import com.game.module.map.view.MapLoader;
import com.game.module.map.vo.UserAction;
import com.game.module.user.proxy.UserProxy;
import com.game.module.user.vo.StatesVO;

import lang.LangTxt;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;
import org.puremvc.as3.patterns.observer.Notification;

import utils.StringUtil;

public class MapLoaderMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MapLoaderMediator";
    var userProxy:UserProxy;
    var iheroIsland:HIslandService;

    private function get view():MapLoader {
        return getViewComponent() as MapLoader;
    };
    public function MapLoaderMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }
    public function get cityWarProxy():CityWarProxy {
        return facade.retrieveProxy(CityWarProxy.NAME) as CityWarProxy;
    }

    override public function onRegister():void {
        super.onRegister();
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        view.onEventSignal.getSignal(this).listen(dispatch);
        view.getMoneyByNodeSignal.getSignal(this).listen(getMoneyByNode);
        view.getNodeInfoSignal.getSignal(this).listen(getNodeInfo);


    }

    /** 领取仙石 或者箱子*/
    private function getMoneyByNode(args:Array):void
    {
        if(cityWarProxy.cityWarVo.nodeId != args[1])
        return;
        cityWarProxy.sendCityWarMsg([5,args[0],args[1],args[2]]);
    }

    /** 据点详情*/
    private function getNodeInfo(nodeId:uint):void
    {
        var cityId:uint = MapUtil.getCityIdByBuildID(nodeId);
        cityWarProxy.sendCityWarMsg([4,cityId,nodeId]);
    }


    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
//            MapLoaderEvent.ACCESS_BUILD /* 据点点击 */,
//            // 暂时没有大场景地图  不会触发这一段函数
//            MapLoaderEvent.ACCESS_SCENE /* 场景点击 */,
//            MapLoaderEvent.ACCESS_CASTLE /* 帮派城堡点击 */,
//            MapLoaderEvent.ACCESS_HEROISLAND /* 英雄岛点击 */,
//            MapLoaderEvent.NODE_OVER /* 据点划上 */,
//            MapLoaderEvent.NODE_OUT /* 据点划出 */,
//            MapLoaderEvent.MAP_INIT /* 地图初始化 */,
            NotiEvent.CITYWAR_CITYINFO_S,
            NotiEvent.CITYWAR_GIFTINFO_S,
            NotiEvent.CITYWAR_OCCUPY_S,
            NotiEvent.CITYWAR_NODEFIGHTMSG_S
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        trace("MapLoaderMediator handleNotification "+name);
        switch (name) {
            case  MapLoaderEvent.ACCESS_BUILD:
                accessBuildHandler(notification as MapLoaderEvent);
                break;
            case  MapLoaderEvent.ACCESS_SCENE:
                accessSceneHandler(notification as MapLoaderEvent);
                break;
            case  MapLoaderEvent.ACCESS_CASTLE:
                accessCastleHandler(notification as MapLoaderEvent);
                break;
            case  MapLoaderEvent.ACCESS_HEROISLAND:
                accessHeroIslandHandler(notification as MapLoaderEvent);
                break;
            case  MapLoaderEvent.NODE_OVER:
                break;
            case  MapLoaderEvent.NODE_OUT:
                break;
            case  MapLoaderEvent.MAP_INIT:
                mapInitHandler(notification as MapLoaderEvent);
                break;
            case NotiEvent.CITYWAR_CITYINFO_S:
                view.setNodesData(cityWarProxy.cityWarVo);
                break;
//            case NotiEvent.CITYWAR_GIFTINFO_S:   //领取某个城池据点仙石或者宝箱返回
//                view.updateNodeMoneyInfo(body as Array);
//                break;
//            case NotiEvent.CITYWAR_OCCUPY_S:
//                view.updateNodeTip_occupy(body as Array);
//                break;
            case NotiEvent.CITYWAR_NODEFIGHTMSG_S:  //通知据点战斗信息
                view.showNodeFightResult(body as Array);
                break;

        }
    }

    private function mapInitHandler(event:MapLoaderEvent):void {

        var arr:Array = [];
        for (var i:int = 0; i < view.nodeList.length; i++) {
            var obj:Object = view.nodeList[i];

            arr.push([obj.id, obj.x, obj.y]);
        }
        userProxy.userData.mapNodeList = arr;
        var evt:MapOperatorEvent = new MapOperatorEvent(MapOperatorEvent.MAP_INIT, userProxy.mapVO);
        dispatch(evt);
        if (userProxy.mapVO.flag == MapEvent.HEROISLAND) {
            sendNotification(HIslandServiceEvent.MAPNUM_UPDATE);
        }
    }

    private function accessHeroIslandHandler(event:MapLoaderEvent):void {


        if (event.getBody().id == userProxy.mapVO.nodeId) {
            view.goNode(event.getBody());
            //todo
            return;
        }
        //判斷據點是否被佔領，或者未開啟
        var mapdatas:Array = iheroIsland.model.mapNumDatas;
        var mapdata:Object;
        if (mapdatas && mapdatas.length > (event.getBody().id - 0xf001))
            mapdata = mapdatas[event.getBody().id - 0xf001];

        if (mapdata && mapdata.own == 4) {
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_LOCK_STAGE));
            return;
        } else if (mapdata && mapdata.own > 0) {
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, StringUtil.substitute(LangTxt.WARN_HOLDABLE_STAGE, [iheroIsland.model.getStateStr(mapdata.own)])));
            return;
        }

        var buffs:Array = userProxy.userVO.statesArr;
        var len:int = buffs.length;
        var isbuff:int = 0;
        for (var i:int = 0; i < len; i++) {
            var vo:StatesVO = buffs[i] as StatesVO;
            if (vo.id == UserAction.HEROISLAND_MOVABLE) {
                isbuff = 1;
                break;
            } else if (vo.id == UserAction.HEROISLAND_RELIVE) {
                isbuff = 2;
                break;
            }
        }
        switch (isbuff) {
            case 0:
                view.goNode(event.getBody());
                break;
            case 1:
                dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_MOVABLE_STAGE));
                break;
            case 2:
                dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_ALIVE_HEROISLAND));
                break;
        }
    }



    private function accessCastleHandler(event:MapLoaderEvent):void {
        trace("accessCastleHandler");
    }

    private function accessSceneHandler(event:MapLoaderEvent):void {
        trace("accessSceneHandler");
    }

    private function accessBuildHandler(event:MapLoaderEvent):void {
        trace("accessBuildHandler");
        dispatch(new MapOperatorEvent(MapOperatorEvent.STOP_AUTO_RUN));
        dispatch(new MapOperatorEvent(MapOperatorEvent.ACCESS_BUILD,event.getBody()));

    }

}
}