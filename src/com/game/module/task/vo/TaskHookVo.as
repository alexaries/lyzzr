package com.game.module.task.vo {
import com.game.events.NotiEvent;
import com.game.module.clan.vo.ClanModel;
import com.game.module.hIsland.vo.HIslandModel;
import com.game.module.map.util.MapUtil;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.user.vo.StatesVO;
import com.game.vo.MonsterVO;
import com.game.vo.UserData;

import laya.utils.Dictionary;

import org.puremvc.as3.patterns.observer.Notification;

import com.game.utils.ShellUtils;

/**
 * @author john
 */
public class TaskHookVo {
    public var npcId:uint;
    public var type:uint;
    public var count:uint;
    public var time:uint;
    public var max:uint;
    public var state:uint;
    public var lastType:uint = 0;
    public var isAlert:Boolean = false;

    public var isReturn:Boolean = false;

    public var voList:Array = [];

    /**最小化 标识     （true:正常，fasle：最小化） */
    public var miniFlag:Boolean = true;

    public function get svoList():Array {
        var arr:Array = [null, null, null];
//        var list:Array = UserData.instance.userVO.buffList;
//        var svo:StatesVO;
//        list = BufferView.statesArr;
//        for (var i:uint = 0; i < list.length; i++) {
//            svo = list[i] as StatesVO;
//            switch (svo.id) {
//                case 5:
//                    arr[0] = svo;
//                    break;
//                case 6:
//                    arr[1] = svo;
//                    break;
//                case 10:
//                    arr[2] = svo;
//                    break;
//            }
//        }
        return arr;
    }

    public function runTime(svo55:StatesVO, svo56:StatesVO, svo9360:StatesVO):void {
        switch (state) {
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
    }

    public function get npc():TaskNpcStruct {
        return ShellUtils.npcById(this.npcId);
    }

    public function get isCan():Boolean {
        var flag:Boolean = true;
//        var buildId:uint = UserData.instance.buildId;
//        var build:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(buildId);
//        if (!build || (build && [9].indexOf(build.type) == -1) || isInHeroIsland()) {
//            flag = false;
//        }
        return flag;
    }

    /* 是否是英雄岛点 */
    private function isInHeroIsland():Boolean {
        //return (HIslandModel.getInstance().isIn == 1);
        return false;
    }

    /* 是否是帮派战中间 */
    private function isInClanFight():Boolean {
        //return (ClanModel.getInstance().cfStatus == 2 && [0, 1].indexOf(ClanModel.getInstance().cfInStatus) > -1);
        return false;
    }

    public function get hookInfo():uint {
//        dispatch(new NotiEvent(NotiEvent.STRONG_INFO_CMD, 0x1));
//        dispatch(new NotiEvent(NotiEvent.ARENA_INFO_CMD, 0x01));
//        dispatch(new NotiEvent(NotiEvent.ARENA_INFO_CMD, 0x20));
//        dispatch(new NotiEvent(NotiEvent.DAILY_REQUEST_DATA, []));
//        dispatch(new NotiEvent(NotiEvent.TOWER_REQUEST, [0]));
        return 1;
    }

    public function getHookData():MonsterVO {
        var monstervo:MonsterVO;
//        if (UserData.instance.userVO.level >= 30) {
//            var monsters:Dictionary = XMLLocator.getInstance().monsters;
//            var levelM:int = UserData.instance.userVO.level;
//            for each (var item:MonsterVO in monsters) {
//                if (item.type == 2 && item.footHoldId != 0) {
//                    monstervo = item;
//                }
//            }
//        }
        return monstervo;
    }

    public function get hookBuild():int {
//        var list:Array = UserData.instance.mapNodeList;
//        var buildinfo:BuildBaseInfoVO;
        var buildId:uint;
//        for each (var args:Array in list) {
//            buildId = args[0];
//            buildinfo = MapUtil.getBuildBaseInfoVObyId(buildId);
//            if (buildinfo && buildinfo.type == 9) {
//                break;
//            }
//        }
        return buildId;
    }

    public function get autoUpdateState():Boolean {
        var flag:Boolean = false;
        if (state == 3) {

        }
        return flag;
    }

    //////////////////////////////////////
    public function get stateVo6():StatesVO {
//        var list:Array = UserData.instance.userVO.buffList;
//        var svo:StatesVO;
        var result:StatesVO;
//        list = BufferView.statesArr;
//        for (var i:uint = 0; i < list.length; i++) {
//            svo = list[i] as StatesVO;
//            if (svo.id == 6) {
//                result = svo;
//                break;
//            }
//        }
        return result;
    }

    public function get stateVo5():StatesVO {
//        var list:Array = UserData.instance.userVO.buffList;
//        var svo:StatesVO;
        var result:StatesVO;
//        list = BufferView.statesArr;
//        for (var i:uint = 0; i < list.length; i++) {
//            svo = list[i] as StatesVO;
//            if (svo.id == 5) {
//                result = svo;
//                break;
//            }
//        }
        return result;
    }

    public function get stateVo9360():StatesVO {
//        var list:Array = UserData.instance.userVO.buffList;
//        var svo:StatesVO;
        var result:StatesVO;
//        list = BufferView.statesArr;
//        for (var i:uint = 0; i < list.length; i++) {
//            svo = list[i] as StatesVO;
//            if (svo.id == 10) {
//                result = svo;
//                break;
//            }
//        }
        return result;
    }

    public function get lastTypeEx():uint {
        var n:uint = lastType;
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
//        var nt:uint = UserData.instance.nowTime;
//        if ((pop_sd.time / 1000) <= nt && nt < ((pop_ed.time / 1000) + 24 * 60 * 60)) {
//            flag = true;
//        }
        return flag;
    }

    public function get info_data():Array {
        var arr:Array = [true, "超长挂机", "2014年1月24日-2月15日", "      马年到，新春闹，又到了一年一度的新春佳节，在春节活动期间内，挂机时间和修炼时间均增加到168小时。<br/>      包括挂机加速和修炼加速时间也会一同累计哦（最高可累计255小时）！ "];
        return arr;
    }
}
}
