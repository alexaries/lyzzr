/**
 * Created by huangcb on 2017/8/26.
 */
package com.game.module.task.proxy {
import com.game.module.clan.proxy.ClanService;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.hIsland.proxy.HIslandService;
import com.game.module.map.proxy.MapService;
import com.game.module.task.vo.TaskTrackVo;
import com.game.module.task.vo.TaskVO;
import com.game.module.user.proxy.UserProxy;

import lang.LangTxt;

import org.puremvc.as3.interfaces.IProxy;
import com.game.common.mvc.BaseProxy;

import utils.ArrayUtil;

import utils.StringUtil;

public class TaskTrackProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskTrackProxy";

    function  get  service():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    private function get userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    private function get iheroIsland():HIslandService {
        return facade.retrieveProxy(HIslandService.NAME) as HIslandService;
    }

    private function get dailyService():DailyService {
        return facade.retrieveProxy(DailyService.NAME) as DailyService;
    }

    var mapService:MapService;
    var clanService:ClanService;




    public var taskTrackVo:TaskTrackVo = new TaskTrackVo();

    public function TaskTrackProxy() {

        super(NAME);

    }

    public function  get dailyVo():DailyVo {
        return dailyService.vo;
    }


    public function get isTrack():Boolean {
        return userProxy.userData.isTrack;
    }

    public function get isInFight():Boolean {
        return userProxy.userData.isInFight;
    }

    public function get isInCopy():Boolean {
        return userProxy.userData.isInCopy;
    }

    public function get isInFormation():Boolean {
        // CopyModel.getInstance()._formation_init;
        return userProxy.userData.isInFormation;
    }

    public function get isInBabel():Boolean {
        // return BabelModel.getInstance().isInCopy;
        return userProxy.userData.isInBabel;
    }

    public function get isInCountry():Boolean {
        // return CampsModel.getInstance().isJoinIn?true:false;
        return userProxy.userData.isInCountry;
    }

    public function get isInHeroIsload():Boolean {
        return iheroIsland.model.isIn ? true : false;
        //return HeroIslandModel.getInstance().isIn?true:false;
    }

    public function get isInPetDungeon():Boolean {
        return userProxy.userData.isInPetDungeon;
    }

    public function get isInFightdemon():Boolean {
        return userProxy.userData.isInFightdemon;
    }


    public function get cycDescExt():String {
        var desc:String = "";
        if (userProxy.userVO.level >= 30) {
            desc += StringUtil.substitute(LangTxt.TASK_VIEW_35, [dailyVo.cycTask4, 5]);
            desc += StringUtil.substitute(LangTxt.TASK_VIEW_36, [dailyVo.cycTask5, 5]);
            desc += StringUtil.substitute(LangTxt.TASK_VIEW_37, [dailyVo.cycTask6, 5]);
        }
        return desc;
    }

    public function getDescExt(n1:uint, n2:uint, n3:uint, n4:uint):String {
        var desc:String = "";
        if (userProxy.userVO.level >= 30) {
//				desc += StringUtil.substitute(LangTxt.TASK_VIEW_42,n1,5);
//				desc += StringUtil.substitute(LangTxt.TASK_VIEW_39,n2,5);
//				desc += StringUtil.substitute(LangTxt.TASK_VIEW_40,n3,5);
//				desc += StringUtil.substitute(LangTxt.TASK_VIEW_41,n4,5);
        }
        return desc;
    }
}
}