/**
 * Created by huangcb on 2017/9/8.
 */
package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.events.NotiEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.proxy.TaskService;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.TaskCfg;

import config.ConfigManager;

import config.mission.openfunc.IOpenfuncCfg;

import globals.ConfigLocator;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;
import org.puremvc.as3.patterns.observer.Notification;

import utils.ArrayUtil;

public class TaskGuideLinkCommand extends BaseCommand implements ICommand {

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case NotiEvent.TASK_GUIDE_LINK:
                doTaskGuideLink(body[0] as String,body[1] as Boolean)
                break;
        }
    }

    private function openFuncByid(funcid:int):void {

        var func:IOpenfuncCfg = ArrayUtil.find(ConfigManager.instance.mission_openfunc.openfuncCfg, function (of:IOpenfuncCfg) {
            return of.id == funcid;
        });
        var vo:MenuWindowVO = new MenuWindowVO(func.win, MenuWindowVO.OPEN, new Object());
        MenuWindowVO.setTabIndex(vo.data, func.tab);
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));

    }
    private function doTaskGuideLink(str:String,taskGuideAuto:Boolean):void {
       // if (userProxy.userData.isHumanRun) return;

        userProxy.userData.taskGuideArgs = str;
        userProxy.userData.taskGuideAuto =taskGuideAuto;
        var mwav:MenuWindowVO;

        var cmd_arr:Array;
        var cmd:uint;
        var arg_arr:Array;
        var task:uint;
        var build:uint;
        var npc:uint;

        cmd_arr = str.split("_");
        cmd = parseInt(cmd_arr[0]);
        arg_arr = (cmd_arr[1]).split("|");
        switch (cmd) {
            case 0:
                arg_arr = (cmd_arr[1]).split(",");
                build = parseInt(arg_arr[0]);
                task = parseInt(arg_arr[1]);
                npc = parseInt(arg_arr[2]);

                dispatch(new NotiEvent(NotiEvent.MAP_AUTO_RUN, build));

                break;
            case 1:
                arg_arr = (cmd_arr[1]).split(",");
                task = parseInt(arg_arr[0]);
                if (task) {
                    switch (task) {
                        case 126:
                            dispatch(new NotiEvent(NotiEvent.CLAN_VIEW));
                            break;
                        case 14:
                        case 201:
                        case 202:
                            break;
                        case 200:
                            mwav = new MenuWindowVO(MenuWinType.DAILY,MenuWindowVO.OPEN, 5);
                            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, mwav));
                            break;

                    }
                }
                break;
            case 2:
                dispatch(new NotiEvent(NotiEvent.CLOSE_ALL));
                dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, parseInt(arg_arr[0])]));
                break;
            case 3:
                dispatch(new NotiEvent(NotiEvent.CLOSE_ALL));
                switch (userProxy.userVO.country) {
                    case 0:
                    case 1:
                        dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, [13315, 13571][userProxy.userVO.country]]));
                        break;
                    case 2:
                        dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, "30级之后选择阵营,才有师门任务！"));
                        break;
                }
                break;
            case 5:
                arg_arr = (cmd_arr[1]).split(",");
                task = parseInt(arg_arr[0]);
                if (task) {
                    var taskVo:TaskCfg = ConfigLocator.getInstance().taskDic.get(task);
                    //todo
                    /*
                     0 穿戴装备
                     11 分解装备
                     10 强化装备
                     34 穿戴技能
                     37 升级技能
                     34 穿戴法宝
                     35 强化法宝
                     19 招募散仙
                    * 11 "穿戴装备"
                     12 "分解装备"
                     13 "强化装备"
                     14 "穿戴技能"
                     15 "升级技能"
                     16 "穿戴法宝"
                     17 "强化法宝"
                     18 "招募散仙"
                     20 加入阵营*/
                    switch (taskVo.klass) {
                        case 11:
                                openFuncByid(0);
                            break;
                        case 12:
                            openFuncByid(11);
                            break;
                        case 13:
                            openFuncByid(10);
                            break;
                        case 14:
                            openFuncByid(34);
                            break;
                        case 15:
                            openFuncByid(37);
                            break;
                        case 16:
                            openFuncByid(34);
                            break;
                        case 17:
                            openFuncByid(35);
                            break;
                        case 18:
                            openFuncByid(19);
                            break;
                        case 19:
                            openFuncByid(54);
                            break;
                        case 20:
                            if (userProxy.userVO.country == 2) {
                                dispatch(new MapOperatorEvent(MapOperatorEvent.STOP_AUTO_RUN));
                                return;
                            }
                            break;
                    }
                }
                break;
            case 100:
                mwav = new MenuWindowVO(MenuWinType.DAILY,MenuWindowVO.OPEN, 2);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, mwav));
                break;
            case 101:
                mwav = new MenuWindowVO(MenuWinType.DAILY,MenuWindowVO.OPEN, 4);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, mwav));
                break;
            case 102:
                mwav = new MenuWindowVO(MenuWinType.DAILY,MenuWindowVO.OPEN, 5);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, mwav));
                break;
            case 103:
                mwav = new MenuWindowVO(MenuWinType.DAILY,MenuWindowVO.OPEN, 3);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, mwav));
                break;
        }
        return;
    }



}
}
