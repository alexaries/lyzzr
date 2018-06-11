/**
 * Created by huangcb on 2017/8/26.
 */
package com.game.module.task.proxy {
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.clan.proxy.ClanService;
import com.game.module.daily.proxy.DailyService;
import com.game.module.hIsland.proxy.HIslandService;
import com.game.module.hIsland.vo.HIslandModel;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.TranBuildBaseInfoVO;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.vo.TaskHookVo;
import com.game.module.user.proxy.UserProxy;
import com.game.module.user.vo.StatesVO;
import com.game.utils.ShellUtils;
import com.game.vo.MonsterVO;

import globals.ConfigLocator;
import globals.ServiceTime;

import lang.LangTxt;
import lang.SystemInfo;

import laya.utils.Dictionary;
import laya.utils.Handler;

import net.data.recvMsg.task.TaskHookMsg;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.observer.Notification;

import com.game.common.mvc.BaseProxy;

public class TaskHookProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskHookProxy";
    public var vo:TaskHookVo;
    public var oldSpeed:int = 0;

    /**最小化 标识     （true:正常，fasle：最小化） */
    public var miniFlag:Boolean = true;

    function  get  hIslandModel():HIslandModel {
        var hIslandService:HIslandService = facade.retrieveProxy(HIslandService.NAME) as HIslandService;
        return hIslandService.model;
    }

    public function onGotoHook(type:String):void {
        if (type == "ok") {
            var monster:MonsterVO;
            var hookid:int = 0x1107;
            if (hIslandModel.isIn == 0) {
                hookid = hookBuild;
                if (hookid == 0) {
                    monster = getHookData();
                    if (monster) {
                        hookid = monster.footHoldId;
                    }
                }
            }
            // dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [1, hookid]));
        } else {
            userProxy.userData.isAutoHook = 0;
        }
        return;
    }

    //挂机
    public function get mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    public function get iheroIsland():HIslandService {
        return facade.retrieveProxy(HIslandService.NAME) as HIslandService;
    }

    public function get clanService():ClanService {
        return facade.retrieveProxy(ClanService.NAME) as ClanService;
    }

    public function get userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    public function TaskHookProxy() {
        vo = new TaskHookVo();
        super(NAME);
    }


    public function doTaskResponseHook(evt:Object):void {
        var msg:TaskHookMsg = evt as TaskHookMsg;
        vo.npcId = msg.npcId;
        vo.type = msg.type;
        vo.count = msg.count;
        vo.time = msg.time;
        vo.max = msg.max;
        vo.state = msg.state;

        if (!vo.isReturn && vo.time > 0)
            dispatch(new NotiEvent(NotiEvent.HOOK_MINI_FIRST, false));
        vo.isReturn = true;
        if (vo.time > 0) {
            vo.lastType = msg.state;
        }

        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_HOOK, []));
        //    dispatch(new NotiEvent(NotiEvent.GUIDE_TAB_CHANGE, []));
        return;
    }

    public function get svoList():Array {
        var arr:Array = [null, null, null];
        var list:Array = userProxy.userVO.buffList;
        var svo:StatesVO;
        list = userProxy.userVO.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            switch (svo.id) {
                case 5:
                    arr[0] = svo;
                    break;
                case 6:
                    arr[1] = svo;
                    break;
                case 10:
                    arr[2] = svo;
                    break;
            }
        }
        return arr;
    }

    public function runTime(svo55:StatesVO, svo56:StatesVO, svo9360:StatesVO):void {
        switch (vo.state) {
            case 0:
                break;
            case 1:
                if (svo55)
                    svo55.remain--;
                break;
            case 2:
                if (svo56)
                    svo56.remain--;
                break;
            case 3:
                if (svo9360)
                    svo9360.remain--;
                break;
        }
        return;
    }

    public function get npc():TaskNpcStruct {
        return ShellUtils.npcById(vo.npcId);
        // return ShellUtils.npcInBuildById(this.npcId);
    }

    public function get isCan():Boolean {
        var flag:Boolean = true;
        var buildId:uint = userProxy.userData.buildId;
        var build:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, buildId);
        if (!build || (build && [9].indexOf(build.type) == -1) || isInHeroIsland()) {
            flag = false;
            //dispatch(new NotiEvent(NotiEvent.ROLL_ALERT,LangTxt.HOOK_ALERT));
        }
        return flag;
    }

    public function get isCanHook():Boolean {
        var buildId:uint = userProxy.userData.buildId;
        var dailyProxy:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        var tranvo:TranBuildBaseInfoVO = MapUtil.getTranBuildBaseInfoVObyId(mapService.mapModel, userProxy.userData.buildId);
        return buildId != dailyProxy.vo.buildId && tranvo == null;
    }

    /* 是否是英雄岛点 */
    private function isInHeroIsland():Boolean {
        return (iheroIsland.model.isIn == 1);
        //return (HeroIslandModel.getInstance().isIn == 1) ;
    }

    /* 是否是帮派战中间 */
    private function isInClanFight():Boolean {
        return (clanService.clanModel.cfStatus == 2 && [0, 1].indexOf(clanService.clanModel.cfInStatus) > -1);
    }


    public function getHookData():MonsterVO {
        var monstervo:MonsterVO;
        if (userProxy.userVO.level >= 30) {
            var monsters:Dictionary = ConfigLocator.getInstance().monsters;
            var levelM:int = userProxy.userVO.level;
            for (var i:int = 0; i < monsters.values.length; i++) {
                var item:MonsterVO = monsters.values[i];

                if (item.type == 2 && item.footHoldId != 0) {
                    monstervo = item;
//						if (item.level == levelM ) {
//							monstervo = item;
//							break;
//						} else if (item.level < levelM) {
//							if (!monstervo)
//								monstervo = item ;
//							if (monstervo.level < item.level)
//								monstervo = item ;
//						}
                }
            }
        }
        return monstervo;
    }

    public function get hookBuild():int {
        var list:Array = userProxy.userData.mapNodeList;
        var buildinfo:BuildBaseInfoVO;
        var buildId:uint;
        for (var i:int = 0; i < list.length; i++) {
            var args:Array = list[i];
            buildId = args[0];
            buildinfo = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, userProxy.userData.buildId);
            if (buildinfo && buildinfo.type == 9) {
                break;
            }
        }
        return buildId;
    }

    public function get autoUpdateState():Boolean {
        var flag:Boolean = false;
        if (vo.state == 3) {

        }
        return flag;
    }

    //////////////////////////////////////
    public function get stateVo6():StatesVO {
        var list:Array = userProxy.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        list = userProxy.userVO.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 6) {
                result = svo;
                break;
            }
        }
        return result;
    }

    public function get stateVo5():StatesVO {
        var list:Array = userProxy.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        list = userProxy.userVO.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 5) {
                result = svo;
                break;
            }
        }
        return result;
    }

    public function get stateVo9360():StatesVO {
        var list:Array = userProxy.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        list = userProxy.userVO.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 10) {
                result = svo;
                break;
            }
        }
        return result;
    }

    public function get lastTypeEx():uint {
        var n:uint = vo.lastType;
        if (n == 1) {
            if (stateVo5 && stateVo5.remain > 0) {
            } else {
                n = 0;
            }
        } else if (n == 2) {
            if (stateVo6 && stateVo6.remain > 0) {
            } else {
                n = 0;
            }
        } else if (n == 3) {
            if (stateVo9360 && stateVo9360.remain > 0) {
            } else {
                n = 0;
            }
        }
        return n;
    }

    //
    public var pop_sd:Date = new Date(2014, 0, 18, 0, 0, 0, 0);
    public var pop_ed:Date = new Date(2014, 1, 15, 0, 0, 0, 0);

    public function get isPop():Boolean {
        var flag:Boolean = false;
        var nt:uint = ServiceTime.getInstance().nowTime;
        if ((pop_sd.getTime() / 1000) <= nt && nt < ((pop_ed.getTime() / 1000) + 24 * 60 * 60)) {
            flag = true;
        }
        return flag;
    }

    public function get info_data():Array {
        var arr:Array = [true, "超长挂机", "2014年1月24日-2月15日", "      马年到，新春闹，又到了一年一度的新春佳节，在春节活动期间内，挂机时间和修炼时间均增加到168小时。<br/>      包括挂机加速和修炼加速时间也会一同累计哦（最高可累计255小时）！ "];
        return arr;
    }


    public function noHookCan():void {
        Alert.show(LangTxt.TASK_HOOK_ALERT, " ", [SystemInfo.OK, SystemInfo.CANCEL], Handler.create(this, this.onGotoHook));
    }
}
}