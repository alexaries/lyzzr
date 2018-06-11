/**
 * Created by huangcb on 2017/9/28.
 */
package com.game.module.worldMap.mediator {

import com.game.events.NotiEvent;
import com.game.module.citywar.proxy.CityWarProxy;
import com.game.module.citywar.proxy.CityWarUtil;
import com.game.module.citywar.view.WorldMapCityItem;

import com.game.module.map.util.MapUtil;
import com.game.module.pack.util.PackUtil;
import com.game.module.worldMap.view.WorldMapView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

public class WorldMapMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "WorldMapMediator";

    private function get view() :WorldMapView{
        return getViewComponent() as WorldMapView;
    }
    public function WorldMapMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }
    public function get cityWarProxy():CityWarProxy {
        return facade.retrieveProxy(CityWarProxy.NAME) as CityWarProxy;
    }

    override public function onRegister():void {
        super.onRegister();
        view.toBuildSignal.getSignal(this).listen(toBuild);
        view.returnSignal.getSignal(this).listen(returnMyhome);
        view.onCompleteSignal.getSignal(this).listen(wordMapComplete);


        cityWarProxy.sendCityWarMsg([0x02]);
        view.addEff(cityWarProxy.cityWarVo.cityId);


    }

    private function wordMapComplete():void
    {
        if(view.data == 1)
        {
            PackUtil.showCityWarPop();
        }
    }

    private function toBuild(tobuildID:int,item:WorldMapCityItem):void {
        var cityId:uint = MapUtil.getCityIdByBuildID(tobuildID);
        if(CityWarUtil.XIANJIE == cityId)
        {
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT,"不可进入仙界"));
            return;
        }

        if(cityWarProxy.cityWarVo.nodeId != CityWarUtil.CDU_NODE && tobuildID == CityWarUtil.CDU_NODE)
        {
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT,"不可再进入成都"));
            return;
        }

//        if(item._readytime > 0 && cityWarProxy.cityWarVo.cityId != cityId && item.vo.fighterId.equals(StaticConfig.bigUserId) == false)
//        {
//            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT,"该城池处于战斗期间，不可进入"));
//            return;
//        }



        dispatch(new NotiEvent(NotiEvent.CLOSE_HOME));
        view.stopNodeStatus();

//        facade.notifyObservers(new MapOperatorEvent(MapOperatorEvent.DELIVER,[1,tobuildID]));

        dispatch(new NotiEvent(NotiEvent.CITYWAR_CHANGEMAP_C,cityId));
        cityWarProxy.sendCityWarMsg([0x03,cityId]);

        view.dispose();
    }

    private function returnMyhome():void
    {
        dispatch(new NotiEvent(NotiEvent.OPEN_HOME));
//        view.stopNodeStatus();
//        dispatch(new NotiEvent(NotiEvent.CITYWAR_CHANGEMAP_C,cityWarProxy.cityWarVo.cityId));
//        cityWarProxy.sendCityWarMsg([0x03,cityWarProxy.cityWarVo.cityId]);
        view.dispose();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.CITYWAR_CITYLIST_S,
            NotiEvent.CITYWAR_CITYINFO_S];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.CITYWAR_CITYLIST_S:
                view.addFlagOnNode(body as Array);
                break;

        }
    }



}
}