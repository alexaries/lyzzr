/**
 * Created by huangcb on 2018/3/16.
 */
package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseCommand;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.vo.TaskType;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.TaskCfg;

import config.ConfigManager;

import config.mission.openfunc.IOpenfuncCfg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

import utils.ArrayUtil;

public class TaskSGLCommand extends BaseCommand implements ICommand {
    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var task:TaskTrackItemVo=body as TaskTrackItemVo;
        switch (name) {
            case NotiEvent.TASK_SLG:

                doTask(task);

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
    private function doTask(evt_text:TaskTrackItemVo):void {
        var taskVo:TaskCfg = evt_text.task.cfg;
        //todo
        /*
         1	升级	升到XX等级	等级数字，如10,20,30
         2	打怪	打怪	怪物groupid，如30001
         3	战斗力	达到XX战斗力	战斗力数字，如66666
         4	仙战掠夺	仙战玩法中掠夺1次	1
         5	仙战占城	仙战玩法中占领城池据点1次	1
         6	城主与宣战	仙战玩法中成为城主或发起宣战1次	1
         7	收取仙石	仙战玩法中收取仙石1次	1
         8	累计仙石	仙战玩法中当日累计获得XX仙石	仙石数量，如666
         9	阵图	挑战阵图1次	1
         10	决战之地	挑战决战之地1次	1
         11	九疑鼎	使用1次九疑鼎	1
         12	分解物品	分解物品	1
         13	强化装备	强化装备	1
         14	穿戴技能	穿戴技能	1
         15	升级技能	升级技能	1
         16	穿戴法宝	穿戴法宝	1
         17	强化法宝	强化法宝	1
         18	招募散仙	招募散仙	1
         19	锁妖塔通过第N层	锁妖塔通过第N层	层数，如1,5,10，最高曾经打败过这一层便可完成
         20	加入阵营	加入阵营	1
         21	斗剑	参与斗剑1次	1
         22	斗剑历练	斗剑历练1次	1
         23	好友邀请	发起好友邀请1次	1
         24	帮会	加入或创建一个帮会	1
         25	洗炼	洗炼主角1次	1
         26	技能符文	升级1次技能符文	1
         27	宝石合成	宝石合成1次	1
         28	宝石镶嵌	镶嵌宝石N个	主角和上阵散仙的宝石个数，如1,5,6
         29 打开单人副本

         */
        switch (taskVo.klass) {
            case 2://打怪	打怪	怪物groupid，如30001
                dispatch(new Notification(NotiEvent.FIGHT_REQUEST_NPC, [taskVo.step[0]]));
                break;
            case 4:
                dispatch(new Notification(NotiEvent.CITYWAR_OPEN_VIEW, [1,0]));
                break;
            case 5:
                dispatch(new Notification(NotiEvent.CITYWAR_OPEN_VIEW, [1,1]));
                break;
            case 6:
                dispatch(new Notification(NotiEvent.CITYWAR_OPEN_VIEW, [1,0]));
                break;
            case 7:
                dispatch(new Notification(NotiEvent.CITYWAR_OPEN_VIEW, [1,0]));
                break;
            case 8:
                dispatch(new Notification(NotiEvent.CITYWAR_OPEN_VIEW, [1,0]));
                break;
            case 9:
                openFuncByid(33);
                break;
            case 10:
                openFuncByid(31);
                break;
            case 11:
                openFuncByid(6);
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
                openFuncByid(35);
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
                dispatch(new NotiEvent(NotiEvent.POPUP_DEMO, [MenuWinType.CAMP_SELECT_VIEW, 1]));
                break;
            case 21:
                openFuncByid(56);
                break;
            case 22:
                openFuncByid(57);
                break;
            case 23:
                openFuncByid(22);
                break;
            case 24:
                openFuncByid(43);
                break;
            case 25:
                openFuncByid(1);
                break;
            case 26:
                openFuncByid(111);
                break;
            case 27:
                openFuncByid(13);
                break;
            case 28:
                openFuncByid(13);
                break;
            case 29:
                openFuncByid(32);
                break;
            default :
                Alert.roll( evt_text.tips);
                break;
        }

    }
}
}