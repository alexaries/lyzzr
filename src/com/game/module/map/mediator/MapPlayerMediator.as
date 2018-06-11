/**
 * Created by huangcb on 2017/8/24.
 */
package com.game.module.map.mediator {
import com.game.module.battle.util.FfUtil;
import com.game.module.citywar.proxy.CityWarProxy;
import com.game.module.map.events.MapEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.view.MapPlayer;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

public class MapPlayerMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MapPlayerMediator";
    var userProxy:UserProxy;
    var mapService:MapService;

    private function get view():MapPlayer {
        return getViewComponent() as MapPlayer;
    };
    public function MapPlayerMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }
    public function get cityWarProxy():CityWarProxy {
        return facade.retrieveProxy(CityWarProxy.NAME) as CityWarProxy;
    }
    override public function onRegister():void {
        super.onRegister();
        view.moveOverDispatcher.getSignal(this).listen(playerMoveOver);
        view.moveStartDispatcher.getSignal(this).listen(playerMoveStart);
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        mapService = facade.retrieveProxy(MapService.NAME) as MapService;


        //更新模型

    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [MapOperatorEvent.STOP_AUTO_RUN];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case MapOperatorEvent.STOP_AUTO_RUN:
                stopAutoRunHandle();
                break;
        }
    }

    private function stopAutoRunHandle():void {
        view.stop();
    }


    private function playerMoveStart() : void {
        userProxy.userVO.isHumanRun = true;
        var evt : MapOperatorEvent = new MapOperatorEvent(MapOperatorEvent.PLAYER_MOVE_START);
        dispatch(evt);
    }
    private function playerMoveOver() : void {
        userProxy.userVO.isHumanRun = false;
        view.stop();
        trace("@@@@@@@@@@@@@@@@@@@@@@@@@@@playerMoveOver")
        /**
         * 進入城池  其实 也是 据点    不过是需要加载地图以后  再派发此消息
         *   */
        var evt : MapOperatorEvent ;
        var buidvo : BuildBaseInfoVO ;
        switch(userProxy.mapVO.flag) {
            case MapEvent.COUNTRY:
                trace("暂时无COUNTRY");
                // var vo:MapVO = new MapVO(mapPlayer.nodeId,1);
                // facade.sendNotification(MapConstConfig.ARRIVED_CITY , vo );
                break;
            case MapEvent.CITY:
                    return;

                /**
                 * 到达据点 发送消息  进入据点
                 * */
                buidvo = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel,view.nodeId);
                if (!buidvo) {
                    trace("传送");
                    if (killStateTransValid(view.nodeId)) {
                    } else {
                        evt = new MapOperatorEvent(MapOperatorEvent.DELIVER_NO_MONEY,view.nodeId);

                        dispatch(evt);

//                        var cityId:int = parseInt(view.nodeId.toString().slice(0,4));
//                        cityWarProxy.sendCityWarMsg([0x03,cityId]);
                    }
                } else {
                    trace("进入据点   需要发送消息 通知 任务弹出");
                    evt = new MapOperatorEvent(MapOperatorEvent.ARRIVED_BUILD,view.nodeId);

                    dispatch(evt);

                    evt = new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_BUILD_HANDLE,buidvo);
                    dispatch(evt);

//                    var cityId:int = parseInt(view.nodeId.toString().slice(0,4));
//                    cityWarProxy.sendCityWarMsg([0x04,cityId,view.nodeId]);
                }
                break;
            case MapEvent.CASTLE:
                // 暂时无
                // setPlayerPoint(mapPlayer.nodeId);
                break;
            case MapEvent.HEROISLAND:
                //英雄岛 移动到据点
                buidvo = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel,view.nodeId);
                evt = new MapOperatorEvent(MapOperatorEvent.ARRIVED_HEROISLAND,view.nodeId);
                dispatch(evt);
                evt = new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_HEROISLAND_HANDLE,buidvo);
                dispatch(evt);
                break;
            default:
                break;
        }
    }



    public function killStateTransValid(transLocID:int):Boolean {
        return false;
    }
}
}