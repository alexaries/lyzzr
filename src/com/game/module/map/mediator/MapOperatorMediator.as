/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.module.map.mediator {
import com.game.command.SoundCommand;
import com.game.common.events.FightContainerEvent;
import com.game.common.events.MenuWindowVO;
import com.game.common.events.PopManagerEvent;
import com.game.common.events.ScreenEvent;
import com.game.common.events.WindowEvent;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.babel.proxy.BabelService;
import com.game.module.chaosFight.proxy.ChaosFightProxy;
import com.game.module.clan.proxy.ClanService;
import com.game.module.copy.events.CopyOperateEvent;
import com.game.module.copy.proxy.CopyService;
import com.game.module.darkdragon.proxy.DarkDragonService;
import com.game.module.defwar.proxy.DefWarProxy;
import com.game.module.endwar.proxy.EndWarProxy;
import com.game.module.friendlyDegree.events.FriendlyEvent;
import com.game.module.friendlyDegree.proxy.FriendlyProxy;
import com.game.module.hIsland.proxy.HIslandService;
import com.game.module.jiutianxz.proxy.JiutianXZProxy;
import com.game.module.jixuetai.proxy.JixueService;
import com.game.module.lumber.events.LumberEvent;
import com.game.module.lumber.proxy.LumberProxy;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.view.MapOperation;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.MapConstConfig;
import com.game.module.map.vo.MapVO;
import com.game.module.map.vo.NodeData;
import com.game.module.map.vo.TranBuildBaseInfoVO;
import com.game.module.menu.events.MenuEvent;
import com.game.module.swordfight.proxy.SwordfightEvent;
import com.game.module.swordfight.proxy.SwordfightProxy;
import com.game.module.user.proxy.UserProxy;
import com.game.module.xuanji.proxy.XuanjiProxy;
import com.game.vo.MenuWinType;
import com.game.vo.PopManagerWinType;

import lang.LangTxt;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import com.game.common.mvc.BaseMediator;

import org.puremvc.as3.patterns.observer.Notification;

import utils.KnetAnalysis;

public class MapOperatorMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MapOperatorMediator";
    var userProxy:UserProxy;
    var mapService:MapService;
    var friendlyProxy:FriendlyProxy;
    var lumberProxy:LumberProxy;
    var jixueService:JixueService;
    var swordfightProxy:SwordfightProxy;
    var iheroIsland:HIslandService;
    var endWarProxy:EndWarProxy;
    var defWarProxy:DefWarProxy;
    var copyService:CopyService;
    var clanService:ClanService;
    var chaosFightProxy:ChaosFightProxy;
    var darkDragonService:DarkDragonService;
    var jiutianXZProxy:JiutianXZProxy;
    var babelService:BabelService;
    var xuanjiProxy:XuanjiProxy;

    private function get view():MapOperation {
        return getViewComponent() as MapOperation;
    }

    function  get mapOper():MapOperation {
        return getViewComponent() as MapOperation;
    }

    public function MapOperatorMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        mapService = facade.retrieveProxy(MapService.NAME) as MapService;
        lumberProxy = facade.retrieveProxy(LumberProxy.NAME) as LumberProxy;
        friendlyProxy = facade.retrieveProxy(FriendlyProxy.NAME) as FriendlyProxy;
        swordfightProxy = facade.retrieveProxy(SwordfightProxy.NAME) as SwordfightProxy;
        iheroIsland = facade.retrieveProxy(HIslandService.NAME) as HIslandService;

        clanService = facade.retrieveProxy(ClanService.NAME) as ClanService;

        jixueService = facade.retrieveProxy(JixueService.NAME) as JixueService;
        endWarProxy = facade.retrieveProxy(EndWarProxy.NAME) as EndWarProxy;
        defWarProxy = facade.retrieveProxy(DefWarProxy.NAME) as DefWarProxy;
        copyService = facade.retrieveProxy(CopyService.NAME) as CopyService;
        chaosFightProxy = facade.retrieveProxy(ChaosFightProxy.NAME) as ChaosFightProxy;
        darkDragonService = facade.retrieveProxy(DarkDragonService.NAME) as DarkDragonService;
        jiutianXZProxy = facade.retrieveProxy(JiutianXZProxy.NAME) as JiutianXZProxy;
        babelService = facade.retrieveProxy(BabelService.NAME) as BabelService;
        xuanjiProxy = facade.retrieveProxy(XuanjiProxy.NAME) as XuanjiProxy;
        view.playerAutoLocIDDispatcher.getSignal(this).listen(playerAutoLocID);

    }

    override public function onRemove():void {
        super.onRemove();
    }

    //  eventMap.mapListener(eventDispatcher, ClanServiceEvent.CLANCOPY_UPDATE, onClancopyUpdate);
    override public function listNotificationInterests():Array {
        return [];
        return [MapOperatorEvent.DELIVER,
            MapOperatorEvent.ARRIVED_BUILD_OPEN,
            /*传送门的传送 不收取任何费用*/
            MapOperatorEvent.DELIVER_NO_MONEY,
            MapOperatorEvent.ACCESS_BUILD,
            /*打断自动行走*/
            MapOperatorEvent.STOP_AUTO_RUN,
            /*地图初始化完成  设置人物位置等等*/
            MapOperatorEvent.MAP_INIT,
            /*进入据点的处理  酒馆  聚星 普通等等*/
            MapOperatorEvent.MAP_ENTER_BUILD_HANDLE,
            /*玩家移动消息  玩家开始移动*/
            MapOperatorEvent.PLAYER_MOVE_START,
            /*移动到据点*/
            MapOperatorEvent.ARRIVED_BUILD,
            MapOperatorEvent.ARRIVED_HEROISLAND,
            MapOperatorEvent.MAP_ENTER_HEROISLAND_HANDLE];
    }

    override public function handleNotification(event:INotification):void {
        var name:String = event.getName();
        var data:Object = event.getBody();

        switch (name) {
            case MapOperatorEvent.DELIVER:
                deliverHandle(data as Array);
                break;
            case MapOperatorEvent.DELIVER_NO_MONEY:
                deliverNoMomeyHandle(data as int);
                break;
            case MapOperatorEvent.STOP_AUTO_RUN:
                stopAutoRunHandle();
                break;
            case MapOperatorEvent.MAP_INIT:
                mapInitHandle(data as MapVO);
                break;
            case MapOperatorEvent.MAP_ENTER_BUILD_HANDLE:
                mapEnterBuildHandle(data as BuildBaseInfoVO);
                break;
            case MapOperatorEvent.PLAYER_MOVE_START:
                playerMoveStartHandle();
                break;
            case MapOperatorEvent.ARRIVED_BUILD:
                arriveBuildHandle(data as int);
                break;
            case MapOperatorEvent.ARRIVED_HEROISLAND:
                arriveHeroIslandHandle(data as int);
                break;
            case MapOperatorEvent.MAP_ENTER_HEROISLAND_HANDLE:
                mapEnterHeroIslandHandle(data as BuildBaseInfoVO);
                break;
            case MapOperatorEvent.ACCESS_BUILD:
                allowArrive(data);
                dispatch(new NotiEvent(NotiEvent.MAP_BUILD_CLICK));
                break;
            case MapOperatorEvent.ARRIVED_BUILD_OPEN:
                tryOpenBuild(data as int);
                break;
        }

    }

    public function tryOpenBuild(nodeId:int):void {

        if (mapService.mapModel.IS_NEED_OPENBUILD) {
            openBuild(nodeId);
            mapService.mapModel.IS_NEED_OPENBUILD = false;
        }
    }

    public function openBuild(nodeId:int):void {

        mapService.buildvo = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, nodeId);
        if (!mapService.mapModel.mapNodes || mapService.mapModel.mapNodes.length == 0) {
            if (mapService.buildvo) {
                if (mapService.buildvo.type == 4 && babelService.model.babelHookVo)
                    dispatch(new FightContainerEvent(FightContainerEvent.BABEL_HOOK_SHOW, babelService.model.babelHookVo));
                else if (mapService.buildvo.type == 3 && copyService.copyModel.copyHookVo)
                    dispatch(new FightContainerEvent(FightContainerEvent.COPY_HOOK_SHOW, copyService.copyModel.copyHookVo));
                else if (mapService.buildvo.type == 2 && copyService.copyModel.formationHookVo)
                    dispatch(new FightContainerEvent(FightContainerEvent.FORMATION_HOOK_SHOW, copyService.copyModel.formationHookVo));
                else
                    dispatch(new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_BUILD_HANDLE, mapService.buildvo));
            }
        }

    }

    public function allowArrive(data:Object):Boolean {
        trace("@@allowArrive");
        view.nodeData = data as NodeData;
        if (view.nodeData.id != userProxy.mapVO.nodeId)
            ableMoveHandle(goHead, [view.nodeData]);
        else
            goHead(view.nodeData);
        return true;
    }

    public function goHead(data:NodeData):void {
        view.goNode(data);
    }

    private function mapInitHandle(mapvo:MapVO):void {
        trace("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@mapInitHandle")
        view.setPlayerPoint(mapvo.nodeId);
        view.showLoading(false);

        dispatch(new NotiEvent(NotiEvent.MAP_INIT));


        if (!mapService.map_init) {
            mapService.map_init = true;


            //todo if (UserData.instance.userVO.level >= 40) {}


            //主动开启情义
            /*
             if(FriendshipModel.isInTime && !FriendshipModel.initiativeOpen)
             {
             FriendshipModel.initiativeOpen = true;

             var  action = new MenuWinActionVO(MenuWinType.FRIENDSHIP, MenuWinActionVO.OPEN);
             dispatch(new MenuEvent(MenuEvent.MENU_CLIK, action));
             }
             */
            //todo


            if ([4, 5].indexOf(StaticConfig.platflag) > -1)
                dispatch(new NotiEvent(NotiEvent.REFRESH_TURNTABLE));
            if ([0, 1, 2].indexOf(StaticConfig.platflag) > -1 && (StaticConfig.pubacctcuprum > 0 || StaticConfig.pubacctgold > 0 || StaticConfig.pubacctsilver > 0)) {
                dispatch(new NotiEvent(NotiEvent.GUIDE_BUBBLE_TIP, [4]));
            }
            if (StaticConfig.gad && StaticConfig.gad[0] && StaticConfig.gad[0][0]) {
                //onRequestXML("config.xml");
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 0]));
            } else {
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [0, 0]));
            }


            openBuild(mapvo.nodeId);


            dispatch(new NotiEvent(NotiEvent.MUSIC_CHANGE));

        }
        tryOpenBuild(mapvo.nodeId);
        doAutoRunHandle();
    }

    private function mapEnterHeroIslandHandle(buildvo:BuildBaseInfoVO):void {
        // 判断是安全区还是非安全区
        dispatch(new FightContainerEvent(FightContainerEvent.HEROISLAND_PK_SHOW, buildvo.id));
    }

    private function arriveHeroIslandHandle(nodeID:int):void {
        if (nodeID > 0xf000) {
            if (nodeID != userProxy.mapVO.nodeId) {
                nodeID -= 0xf001;
                iheroIsland.sendHeroIslandHandle(3, nodeID);
            }
        }
    }

    private function arriveBuildHandle(nodeID:int):void {
        mapService.sendBuildPointMapCmd(nodeID);

    }

    private function playerMoveStartHandle():void {
        this.dispatch(new NotiEvent(NotiEvent.PLAYER_MOVE_START));
        // 关闭日常
    }

    private function mapEnterBuildHandle(buildvo:BuildBaseInfoVO):void {

        trace("@@mapEnterBuildHandle")
        if (buildvo.type == 9) {
            dispatch(new NotiEvent(NotiEvent.ARRIVE_BUILD, buildvo.id));
            //弹出

        }
        if (buildvo.id == lumberProxy.POS_ID && lumberProxy.isOpen) {
            if (lumberProxy.inviter)dispatch(new LumberEvent(LumberEvent.REPLY_LUMBER_INVITE, {
                name: lumberProxy.inviter,
                type: 1
            }));
            dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.LUMBER, LumberEvent.STATE_1]));
        } else if (buildvo.id == lumberProxy.POS_ID && lumberProxy.isOpen) {
            if (friendlyProxy.inviter)dispatch(new FriendlyEvent(FriendlyEvent.REPLY_DRINK, {
                name: friendlyProxy.inviter,
                type: 1
            }));
            dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.FRIEND_WINE_SHOP, FriendlyEvent.STATE_1]));
        }
        else if (buildvo.id == 0x4012) //祭血台
        {
            if (!jixueService.model.isInTime()) {
                Alert.show("不在祭血台活动时间内！");
                return;
            }
            if (userProxy.userVO.level < 80) {
                Alert.show("80级后才能进入祭血台");
                return;
            }
            var nodeId:int = userProxy.mapVO.nodeId;
            if (nodeId == 0x4012)
                jixueService.sendEnterMsg();
        }


        switch (buildvo.type) {
            case 10:
                break;
            case 7:
                break;
            case 6:
                /*1 3 5 7 老的阵营战
                 2 4 6   蜀山论剑*/
                var date:Date = new Date(StaticConfig.nowTime * 1000);
                if (date.getDay() == 1 || date.getDay() == 3 || date.getDay() == 5 || date.getDay() == 0) {
                    if (userProxy.userVO.country < 2) {
                        if (userProxy.userVO.level > 39)
                            dispatch(new FightContainerEvent(FightContainerEvent.CAMPS_SHOW, [true, 1]));
                        else
                            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_LIMIT_CTWAR.replace('{0}', 40)));
                    } else
                        dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_NOT_CAMPS));
                }
                //蜀山论剑
                else {
                    /*if(swordfightProxy.swordfightState == 1 || swordfightProxy.swordfightState == 2)
                     {*/
                    if (swordfightProxy.isInSwordfight) {
                        //弹出主界面
                        dispatch(new ScreenEvent(ScreenEvent.SWORDFIGHT, true));
                    }
                    else {
                        //打开参加面板 不能直接打开论剑界面
//                        var action:MenuWindowVO = new MenuWindowVO(MenuWinType.SWORDFIGHT_JOIN, MenuWindowVO.OPEN);
//                        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, action));

                        dispatch(new Notification(SwordfightEvent.CheckSwordFight));
                    }
                    /*}
                     else
                     {
                     //不在活动时间
                     dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, "当前非蜀山论剑活动期间"));
                     }*/
                }
                break;
            case 5:
                // 英雄岛面板开启
                // dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, '英雄岛功能即将开放'));
                if (userProxy.userVO.level > 39) {
                    // 请求英雄岛状态
                    iheroIsland.sendHeroIslandHandle(0);
                    dispatch(new FightContainerEvent(FightContainerEvent.HEROISLAND_SHOW, [true, 1]));
                } else
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_LIMIT_HEROISLAND.replace('{0}', 40)));
                break;
            case 4:
                dispatch(new FightContainerEvent(FightContainerEvent.BABEL_SHOW, [true, buildvo.copyID, babelService.mode]));
                break;
            case 3:
                dispatch(new FightContainerEvent(FightContainerEvent.COPY_SHOW, [true, buildvo.copyID]));
                //dispatch(new NotiEvent(NotiEvent.ARRIVE_BUILD, buildvo.id));
                break;
            case 2:
                if (mapService.deliverData != null) {
                    if (mapService.deliverData[2] == "xuanji") {
                        dispatch(new FightContainerEvent(FightContainerEvent.XUANJI_SHOW, [true, buildvo.copyID + 100]));
                    }
                    else if (mapService.deliverData[2] == "formation") {
                        dispatch(new FightContainerEvent(FightContainerEvent.FORMATION_SHOW, [true, buildvo.copyID]));
                    }
                }
                else {
                    if (xuanjiProxy.xuanjiModel.tabIndex == 0)
                        dispatch(new FightContainerEvent(FightContainerEvent.FORMATION_SHOW, [true, buildvo.copyID]));
                    else
                        dispatch(new FightContainerEvent(FightContainerEvent.XUANJI_SHOW, [true, buildvo.copyID + 100]));
                }

                break;
            case 1:
                // 帮派战
                if (userProxy.userData.clanvo) {
                    if (clanService.clanModel.cfStatus == 2 && clanService.clanModel.cfInStatus == 1)
                        dispatch(new FightContainerEvent(FightContainerEvent.CFIGHT_SHOW, [true, buildvo.id]));
                    else
                        dispatch(new FightContainerEvent(FightContainerEvent.CFIGHT_PRE_SHOW, [true, buildvo.id]));
                }
                break;
            case 11:

                dispatch(new NotiEvent(NotiEvent.CLAN_COPY_CMD, [0x01, 0]));
                break;
            case 12:
                if (endWarProxy.status == 1)
                    dispatch(new ScreenEvent(ScreenEvent.ENDWAR, true));
                break;
            case 13:
                //打开墨守城规参加面板
                if (defWarProxy.status < 3) {
                    if (defWarProxy.status !== 2 || !defWarProxy.inWar) {
                        var actionVo:MenuWindowVO = new MenuWindowVO(MenuWinType.DefWarNoticeWin, MenuWindowVO.OPEN);
                        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, actionVo));
                    } else if (defWarProxy.status == 2 && defWarProxy.inWar) {
                        dispatch(new ScreenEvent(ScreenEvent.DEFWAR, true));
                    }
                }
                break;
            case 15:
                //打开宠物副本
                if (userProxy.userVO.level >= 80 && !userProxy.userData.isInPetDungeon) {
                    dispatch(new NotiEvent(NotiEvent.OPEN_PET_DUNGEON_VIEW));
                }
                break;
            case 16:
                if (!userProxy.userData.isInFightdemon) {
                    dispatch(new NotiEvent(NotiEvent.JOIN_FIGHT_DEMON_TEAM));
                }
                break;


            case 17:
                if (chaosFightProxy.chaosFightVO.state == 1 && userProxy.userVO.level >= 40)
                    dispatch(new ScreenEvent(ScreenEvent.CHAOS_FIGHT, true));
                break;
            case 18:
                if (darkDragonService.darkDragonModel.isInTime)
                    dispatch(new ScreenEvent(ScreenEvent.DARK_DRAGON, true));
                break;
            case 19:
                if (!userProxy.userData.isInJiutianXZ && jiutianXZProxy.jiutianModel.XZstatus != 11)
                    dispatch(new ScreenEvent(ScreenEvent.JIUTIAN_XZ, true));
                break;
            case 21:
                if (userProxy.userVO.level >= 50) {
                    dispatch(new ScreenEvent(ScreenEvent.PETCOMPETITION, true));
                }
                break;
        }
        mapService.deliverData = null;
    }

    private function stopAutoRunHandle():void {
        userProxy.userData.autoNpc = 0;
        if (mapService.mapModel.isAutoRun) {
            mapService.mapModel.isAutoRun = false;
            mapService.mapModel.mapNodes = [];
        }
    }

    private function doAutoRunHandle():void {
        if (mapService.mapModel.isAutoRun && mapService.mapModel.mapNodes && mapService.mapModel.mapNodes.length > 0) {
            // 继续 自动行走
            mapService.mapModel.mapNodes.shift();
            dispatch(new MapOperatorEvent(MapOperatorEvent.MAP_AUTO_RUN));
        } else {
            stopAutoRunHandle();
        }
    }


    private function deliverNoMomeyHandle(tranID:int):void {
//        var tranvo:TranBuildBaseInfoVO = MapUtil.getTranBuildBaseInfoVObyId(mapService.mapModel, tranID);
//        if (tranvo) {
//            dispatch(new NotiEvent(MapConstConfig.MAP_ENABLED, false));
//            mapService.sendBuildPointMapCmd(tranvo.toID);
//        } else {
//        }
    }


    private function deliverHandle(arr:Array):void {
        // 传送的 时候 打断自动行走
        userProxy.userData.autoNpc = 0;
        stopAutoRunHandle();
        // 传送的时候 关闭面板信息
        dispatch(new WindowEvent(WindowEvent.MENU_CLOSE_ALL_WIN));
        var type:int = arr[0] as int;
        var tranID:int = arr[1] as int;
        mapService.deliverData = arr;
        if (tranID == userProxy.mapVO.nodeId) {
            var args:Array = userProxy.userData.auto_group_join;
            if (args && mapService.buildvo.type != 9) {
                args = args.slice(0);
                args = [0].concat(args);
                dispatch(new NotiEvent(NotiEvent.GROUP_COPY_REQUEST_LOBBY_JOIN, args));
                userProxy.userData.auto_group_join = null;
                return;
            }
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.WARN_REPEL_BUILD));
            mapService.buildvo = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, tranID);
            if (!mapService.buildvo)
                return;
            if (mapService.buildvo.type != 9) {
                mapEnterBuildHandle(mapService.buildvo);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.DAILY, MenuWindowVO.OPEN)));

            }
            return;
        }

        if (type != 1)
            ableDo(arr);
        // ableMoveHandle(ableDo, arr);
        else
            ableDo(arr);
    }

    /**
     * 所有判断结束之后
     * @param arr
     *
     */
    private function ableDo(arr:Array):void {
        var type:int = arr[0];
        var tranID:int = arr[1];
        var data:* = arr[2];
        mapService.mapModel.IS_NEED_OPENBUILD = true;
        //todo
        //等级开放
        mapService.sendTransportMapCmd(type, tranID);

        dispatch(new CopyOperateEvent(CopyOperateEvent.COPY_VIEW_SHOW, [0, false]));
        dispatch(new CopyOperateEvent(CopyOperateEvent.FORMATION_VIEW_SHOW, [0, false]));
        dispatch(new WindowEvent(WindowEvent.MENU_CLOSE_ALL_WIN));

        //如果是点击进入寻墨进来的
        if (data == "enterTileGame") {
            dispatch(new NotiEvent(NotiEvent.FOURTH_CAREER_CHANGEPANEL, 10));//切换到寻墨游戏
        }
        //点击参加蜀山论剑过来的
        else if (data == "joinSwordfight") {
            dispatch(new NotiEvent(NotiEvent.SWORDFIGHT_JOIN));//申请加入
        }
        else if (data == "fightdemon") {
            dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [MenuWinType.FIGHT_DEMON, "openTmmc"]));
        }
        else if (data == "invite") {
            dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [MenuWinType.FIGHT_DEMON, ""]))
            dispatch(new NotiEvent(NotiEvent.FIGHTDEMON_POPUPREPLY, arr[3]));
        } else if (data == FriendlyEvent.SEND_TO_DRINK_POS) {//进入对酒界面
            if (arr[3] == FriendlyEvent.REPLY_DRINK) {
                friendlyProxy.isOpen = true;
            } else if (arr[3] == PopManagerWinType.FRIEND_WINE_SHOP) {
                friendlyProxy.isOpen = true;
//                    dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.FRIEND_WINE_SHOP, WineShopView.STATE_1]));
            } else if (arr[3] == PopManagerWinType.LUMBER) {
                lumberProxy.isOpen = true;
//                    dispatch(new PopManagerEvent(PopManagerEvent.SHOW,[PopManagerWinType.LUMBER,LumberPanel.STATE_1]));
            } else if (arr[3] == LumberEvent.REPLY_LUMBER_INVITE) {
                lumberProxy.isOpen = true;
            }
        }
    }

//todo
    public function ableMoveHandle(ableDo:Function, arr:Array):void {
        ableDo.apply(this, arr);
    }

    public function playerAutoLocID(locID:int = 0x1022):void {
        // 首先 找到 路径  判断 locID的前面的城池距离当前的  一个数组  只有到达这个点以后  才有 可以自动行走

        if (locID == userProxy.mapVO.nodeId) {
            var bb:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, userProxy.mapVO.nodeId);
            if (bb) {
                ableMoveHandle(function (aabb:BuildBaseInfoVO):void {
                    dispatch(new MapOperatorEvent(MapOperatorEvent.MAP_ENTER_BUILD_HANDLE, aabb));
                }, [bb]);
            }
            return;
        }
        ableMoveHandle(playerAutoRunCalc, [locID]);

    }

    private function playerAutoRunCalc(locID:int):void {
//        mapService.mapModel.mapNodes = MapUtil.getAutoRunArray(mapService.mapModel, userProxy.mapVO, locID);
//        mapService.mapModel.isAutoRun = true;
//        //有两个以上地图的 直接飞过去
//        if( mapService.mapModel.mapNodes.length>2) {
//            var obj = mapService.mapModel.mapNodes.pop();
//            dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [obj.flag, obj.locID]));
//
//        }else{
//
//            dispatch(new MapOperatorEvent(MapOperatorEvent.MAP_AUTO_RUN));
//        }
    }


}
}