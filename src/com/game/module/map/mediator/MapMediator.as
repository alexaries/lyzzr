package com.game.module.map.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.events.PopManagerEvent;
import com.game.common.mvc.BaseMediator;
import com.game.consts.URLConfig;
import com.game.events.NotiEvent;
import com.game.module.map.events.MapEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.events.MapServiceEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.view.MapView;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.MapConstConfig;
import com.game.module.map.vo.MapVO;
import com.game.module.menu.events.MenuEvent;
import com.game.module.user.events.HeroServiceEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.UserUtil;
import com.game.vo.MenuWinType;
import com.game.vo.PopManagerWinType;

import laya.maths.Point;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import utils.KnetAnalysis;

public class MapMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MapMediator";
    var userProxy:UserProxy;
    var mapService:MapService;

    private function get view():MapView {
        return getViewComponent() as MapView;
    };
    public function MapMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

//        facade.registerMediator(new MapPlayerMediator(view.mapPlayer));
        view.onCompleteSignal.getSignal(this).listen(__onCompleteSignal)
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        mapService = facade.retrieveProxy(MapService.NAME) as MapService;
    }

    private function __onCompleteSignal():void {
//        var clanService:ClanService = facade.retrieveProxy(ClanService.NAME) as ClanService;
//        trace("sendUserinfoCmd");
//        userProxy.sendUserinfoCmd();
//        userProxy.sendReqRideCmd(0);
//        dispatch(new NotiEvent(NotiEvent.PRE_INIT_COMMAND));
//        // 请求自己的帮派技能信息（即使无帮派也可以有）
//        clanService.sendClanSkillCmd(3);
//        //请求帮派神像加成
//        clanService.sendClanCopyCmd([0x01, 0]);
//
//        dispatch(new NotiEvent(NotiEvent.RELATION_LIST_CMD, [3, 0, 20]));
//        dispatch(new NotiEvent(NotiEvent.SHOP_REQUEST_LIST, [2]));
//        dispatch(new NotiEvent(NotiEvent.SHOP_REQUEST_LIST, [3]));
//        dispatch(new NotiEvent(NotiEvent.SHOP_REQUEST_LIST, [4]));
//        dispatch(new NotiEvent(NotiEvent.SHOP_REQUEST_LIST, [5]));
//        // 请求自己的帮派信息（是否有帮派）
//        dispatch(new NotiEvent(NotiEvent.CLAN_VIEW));
//
//        KnetAnalysis.setKingnetaz(KnetAnalysis.GAME_INITED);
//        if (StaticConfig.isNew_web) {
//            KnetAnalysis.setUdpAnalysis("ggzz", KnetAnalysis.NEW_GAME_INITED);
//        }
//        //初始化上线数据
//        facade.notifyObservers(new Notification(NotiEvent.INIT_DATACOMMAND));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {

        return [NotiEvent.CITYWAR_CHANGEMAP_C];
        return [
            MapServiceEvent.MAP_ARRIVED_BUILD,
            /*玩家移动速度修改  玩家坐骑*/
            MapServiceEvent.PLAYER_SPEED_CHANGE,
            /*玩家模型修改*/
            MapServiceEvent.PLAYER_SOURCE_CHANGE,
            /*玩家模型修改*/
            MapServiceEvent.USER_LIST_UPDATE,
            NotiEvent.MAP_AUTO_RUN,
            NotiEvent.DONATION_CHANGE,
            NotiEvent.REQUEST_ADD_MONEY,
            NotiEvent.REQUEST_OPEN_FORTH,
            NotiEvent.REQUEST_OPEN_FORTH_GIFT,
            NotiEvent.MODEL_MAP_ICONS_CHANGE,
            MapConstConfig.MAP_ENABLED,
            MapConstConfig.MAP_VISIBLE,

            /*玩家移动速度修改*/
            //eventMap.mapListener(eventDispatcher, HeroIslandServiceEvent.ACTIVE_UPDATE, onHeroIslandServiceHandle, HeroIslandServiceEvent);
            //eventMap.mapListener(eventDispatcher, HeroIslandServiceEvent.MAPNUM_UPDATE, onHeroIslandServiceHandle, HeroIslandServiceEvent);
            //eventMap.mapListener(view, HeroIslandOperateEvent.SEND_DATA, onHeroIslandOprateHandle, HeroIslandOperateEvent);

            //
            NotiEvent.PrayTree_reward_timer,
            HeroServiceEvent.HERO_RIDE_CHANGE,
            HeroServiceEvent.HERO_CHARM_CHANGE,
            MapOperatorEvent.MAP_AUTO_RUN,
            //切换地图
            NotiEvent.MAP_CHANGE,
            NotiEvent.CITYWAR_CHANGEMAP_C];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {

            case MapOperatorEvent.MAP_AUTO_RUN:
                playerAutoRun();
                break;
            case MapServiceEvent.MAP_ARRIVED_BUILD:
                mapArrivedBuildHandle(notification as MapServiceEvent);
                break;

            case MapServiceEvent.PLAYER_SPEED_CHANGE:
                playerSpeedChangeHandle(notification as MapServiceEvent);
                break;
            case MapServiceEvent.PLAYER_SOURCE_CHANGE:
                playerSourceChangeHandle(notification as MapServiceEvent);
                break;
            case MapServiceEvent.USER_LIST_UPDATE:
                userlistUpdateHandle(notification as MapServiceEvent);
                break;
            case NotiEvent.MAP_AUTO_RUN:
                mapAutoRunHandle(notification as NotiEvent);
                break;
            case MapConstConfig.MAP_ENABLED:
                mapEnableHandle(notification as NotiEvent);
                break;
            case MapConstConfig.MAP_VISIBLE:
                mapVisibleHandle(notification as NotiEvent);
                break;
            case NotiEvent.REQUEST_ADD_MONEY:
                // view.vipClick();
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.NEWVIP_VIEW, MenuWindowVO.OPEN)));
                break;
            case NotiEvent.REQUEST_OPEN_FORTH:
                view.forthOpenClick();
                break;
            case NotiEvent.REQUEST_OPEN_FORTH_GIFT:
                view.forthGiftClick();
                break;
            case NotiEvent.MODEL_MAP_ICONS_CHANGE:
                view.setTaskData(userProxy.userData.curMapBuildsIcon);
                break;
            case NotiEvent.DONATION_CHANGE:
                donationChange();
                break;
            case NotiEvent.PrayTree_reward_timer:
                prayTree_reward_timer();
                break;
            case HeroServiceEvent.HERO_RIDE_CHANGE:
                //更改玩家飞剑模型
                playerRideSourceChangeHandle(notification as HeroServiceEvent);
                break;
            case HeroServiceEvent.HERO_CHARM_CHANGE:
                //更改玩家符咒模型
                playerCharmSourceChangeHandle(notification as HeroServiceEvent);
                break;
            //切换地图
            case NotiEvent.MAP_CHANGE:
                onMapChange(notification as NotiEvent);
                break;
            //切换地图
            case NotiEvent.CITYWAR_CHANGEMAP_C:
                onMapChangeByCitywar(body as int);
                break;
        }
    }


    private function onMapChangeByCitywar(cityId:int):void {
        var mapvo:MapVO = new MapVO(mapService.mapModel, cityId, 1);
        changeMapSkin(mapvo);
    }


    private function onMapChange(evt:NotiEvent):void {

        var args:Array = evt.getBody() as Array;
        trace("@@@@@@@@@@onMapChange", args)
        var index:int = args[0];

        if (URLConfig.skin != index) {
            URLConfig.skin = index;
            //todo
            //比较  查看   据点坐标是不是在当前地图上,如果不在切换地图，并设置人物起始点
            var mapvo:MapVO = new MapVO(mapService.mapModel, index >> 8, 1);
            // var mapCfg:ICity_config_city=ArrayUtil.find(ConfigManager.instance.scene_city.config.city,function(v:ICity_config_city){return v.id==index});
            changeMapSkin(mapvo);
            userProxy.sendReqChangeUserInfoCmd(0x1a, URLConfig.skin);
            //todo
            userProxy.mapVO = mapvo;
            trace(["地图切换:", URLConfig.skin].join(","), true);
        }


    }

    function changeMapSkin(value:MapVO) {

        if (view.mapVO != null && view.mapVO.cityId == value.cityId && view.mapVO.cityId != 0) {
            return;
        } else {
            if (!value || value.flag != view.mapLoader.flag) {
                switch (view.mapLoader.flag) {
                    case MapEvent.CITY:
                        dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.HISLAND_TITLEVIEW, false]));
                        dispatch(new NotiEvent(NotiEvent.MENU_VISIBLE, [1, true]));
                        break;
                    case MapEvent.COUNTRY:
                        break;
                    case MapEvent.CASTLE:
                        break;
                    case MapEvent.HEROISLAND:
                        dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.HISLAND_TITLEVIEW, true]));
                        dispatch(new NotiEvent(NotiEvent.MENU_VISIBLE, [1, false]));
                        break;
                }
            }
            view.changeMapSkin(value);
        }
    }

    private function playerCharmSourceChangeHandle(evt:HeroServiceEvent):void {
//        var url:String = charmService.charmModel.getFightVoSrcRide();
//        view.setMapPlayerCharmSrc(url);
    }

    private function playerRideSourceChangeHandle(evt:HeroServiceEvent):void {
        var url:String = userProxy.userVO.rideModelUrl;
        view.setMapPlayerRideSrc(url);
    }

    private function mapVisibleHandle(evt:NotiEvent):void {
        view.setVisible((evt.getBody) as Boolean);
    }

    private function mapEnableHandle(evt:NotiEvent):void {
        view.mapEnabled((evt.getBody) as Boolean);
    }

    private function mapAutoRunHandle(evt:NotiEvent):void {
        var nodeID:int = (evt.getBody()) as int;
        view.playerAutoLocID(nodeID);
    }

    private function prayTree_reward_timer() {
//        if (!userProxy.userVO.prayTreeVo.hasWish && !userProxy.userVO.prayTreeVo.isReachMaxCount) {//no wish
//            dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 18]));
//        } else if (userProxy.userVO.prayTreeVo.cdOver) {//can getreward
//            dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 18]));
//        } else if (userProxy.userVO.prayTreeVo.leftTime != 0) {//timer
//            //todo TimerManager.addFunction(timerHandler);
//        } else {
//            dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [0, 18]));
//        }
    }

    private function donationChange() {
        var _supportMoney:int = userProxy.userVO.donation;
        var viplevel:int = userProxy.userData.viplevel;
        var getviplevel:int = UserUtil.getVIPLevel(_supportMoney);
        userProxy.userData.vipCfgs = MapConstConfig.VIPData[getviplevel];
        if ((userProxy.userData.activeInfo & 0x1) > 0) {
            if (userProxy.userData.vipCfgs[1] > 5)
                userProxy.userData.vipCfgs[1] = 5;
            userProxy.userData.vipCfgs[8] = 1;
            userProxy.userData.vipCfgs[10] = 1;
            userProxy.userData.vipCfgs[12] = 1;
            userProxy.userData.vipCfgs[16] = 1;
            userProxy.userData.vipCfgs[19] = 1;
            userProxy.userData.vipCfgs[23] = 1;
            userProxy.userData.vipCfgs[24] = 1;
            userProxy.userData.vipCfgs[25] = 1;
            userProxy.userData.vipCfgs[26] = 1;
            userProxy.userData.vipCfgs[27] = 1;
        }
        if (viplevel != getviplevel) {
            userProxy.userData.viplevel = getviplevel;
            // var p:DailyProxy=ApplicationFacade.getInstance().retrieveProxy(DailyProxy.NAME) as DailyProxy;
            // p.sendDailyDataCmd();
            dispatch(new NotiEvent(NotiEvent.VIP_LEVEL, getviplevel));
            dispatch(new NotiEvent(NotiEvent.DONATION_VIP_LEVEL, getviplevel));
            // vip等级改变
            if (getviplevel >= 1) {//许愿树 置顶图标
                this.dispatch(new NotiEvent(NotiEvent.PrayTree_reward_timer));
            }
        }
    }

    private function fighRequestNpc(data:Object) {
        var ar:Array = data as Array;
        var npcId:int = 0;
        if (ar && ar.length > 0)
            npcId = ar[0];
        //todo
        /*
         if(dailyVo&& dailyVo.bossId != 0 && npcId == dailyVo.bossId){
         if(StaticConfig.platflag==4){
         FBInternal.sendGift(3,0);
         }
         QQInternal.sendGift(103);
         }
         */
        if (npcId == 5001 && userProxy.userVO.level < 2) {
            if (StaticConfig.isNew_web)
                KnetAnalysis.setUdpAnalysis("ggzz", KnetAnalysis.NEW_FINGHT_LOAD_START);
        }

    }


    private function userlistUpdateHandle(evt:MapServiceEvent):void {
        var arr:Array = evt.getBody() as Array;
        view.setMapUserData(arr);
    }

    private function playerSourceChangeHandle(evt:MapServiceEvent):void {
        trace("@@@@@@@@@@@@@@playerSourceChangeHandle");
        var url:String = (evt.getBody() as String);
        view.setMapPlayerSrc(url);
        view.setMapPlayerRideSrc(userProxy.userVO.rideModelUrl);
//        view.setMapPlayerCharmSrc(charmService.charmModel.getFightVoSrcRide());
    }

    private function playerSpeedChangeHandle(evt:MapServiceEvent):void {
        var dis:int = (evt.getBody() as int);
        view.setPlayerMovDis(dis);
    }

    // 自动行走
    public function playerAutoRun():void {
        var array:Array = mapService.mapModel.mapNodes;
        var evt:MapOperatorEvent;

        if (!array || array.length == 0) {
            var bxx:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, userProxy.mapVO.nodeId);
            if (bxx) {
                evt = new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_BUILD_HANDLE, bxx);
                dispatch(evt);
            }
            return;
        }

        var id:int = array[0].locID;
        if (array[0].flag == 0) {
            // 需要据点移动  从当前点 移动到 目标据点  城池内部据点移动
            if (userProxy.mapVO.nodeId == id) {
                mapService.mapModel.mapNodes.shift();
                if (id == userProxy.mapVO.nodeId) {
                    var bb:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, id);
                    if (bb) {
                        evt = new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_BUILD_HANDLE, bb);
                        dispatch(evt);
                    }
                    return;
                }
                playerAutoRun();
            } else {
                var point:Point = view.getGuidePointFromId(id);
//                view.mapPlayer.goNode(id, point);
            }
        } else if (array[0].flag == 1) {
            // 传送



//            var tranvo:TranBuildBaseInfoVO = MapUtil.getTranBuildBaseInfoVObyId(mapService.mapModel, id);
            // 判断是否开启 PK
//            if (userProxy.mapVO.nodeId == tranvo.toID) {
//                mapService.mapModel.mapNodes.shift();
//                playerAutoRun();
//            }
//            else {
//                if (killStateTransValid(tranvo.id)) {
//
//                }
//                else {
//                    evt = new MapOperatorEvent(MapOperatorEvent.ARRIVED_BUILD, tranvo.toID);
//
//                    dispatch(evt);
//                }
//            }
        }
    }


    public function killStateTransValid(transLocID:int):Boolean {
        return false;
    }

    private function mapArrivedBuildHandle(evt:MapServiceEvent):void {

        var arr:Array = evt.getBody() as Array;
        var mapvo:MapVO = arr[0] as MapVO;

        if (arr[1]) {
            if (mapvo) {
                changeMapSkin(mapvo);
            }
        } else {
            view.setPlayerPoint(mapvo.nodeId);
            dispatch(new MapOperatorEvent(MapOperatorEvent.ARRIVED_BUILD_OPEN,mapvo.nodeId));
        }

        trace("mapArrivedBuildHandle", arr);
    }



}
}