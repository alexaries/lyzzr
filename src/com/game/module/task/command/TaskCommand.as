/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.endlessTower.proxy.EndlessTowerService;
import com.game.module.hIsland.proxy.HIslandService;
import com.game.module.hIsland.vo.HIslandModel;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.proxy.TaskHookProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.MonsterVO;

import lang.LangTxt;
import lang.SystemInfo;

import laya.utils.Handler;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskCommand extends BaseCommand implements ICommand {

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  service():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    function  get  taskHookProxy():TaskHookProxy {
        return facade.retrieveProxy(TaskHookProxy.NAME) as TaskHookProxy;
    }



    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.TASK_REQUEST_ACCEPT_LIST:
                service.doTaskRequestAcceptList(body as Array);

                break;
            case NotiEvent.TASK_REQUEST_CURR_LIST:
                service.doTaskRequestCurrList(body as Array);

                break;
            case NotiEvent.TASK_REQUEST_GIVE_UP:
                service.doTaskRequestGiveUp(body as Array);

                break;
            case NotiEvent.TASK_REQUEST_DIALOG:
                service.doTaskRequestDialog(body as Array);
                break;
            case NotiEvent.TASK_REQUEST_DIALOG_RETURN:
                service.doTaskRequestDialogReturn(body as Array);
                break;
            case NotiEvent.TASK_REQUEST_CYC_FRESH:
                service.doTaskRequestCycFresh(body as Array);
                break;
            case NotiEvent.TASK_REQUEST_HOOK:
                var args:Array = body as Array;
//                if (!taskHookProxy.isCan) {
//                    taskHookProxy.noHookCan();
//                    trace("NotiEvent.TASK_REQUEST_HOOK:==ALERT==========")
//                    return;
//                }
                if (taskHookProxy.vo.time == 0) {
                    dispatch(new NotiEvent(NotiEvent.STRONG_INFO_CMD, 0x1));
                    dispatch(new NotiEvent(NotiEvent.ARENA_INFO_CMD, 0x01));
                    dispatch(new NotiEvent(NotiEvent.ARENA_INFO_CMD, 0x20));
                    dispatch(new NotiEvent(NotiEvent.DAILY_REQUEST_DATA, []));
                    dispatch(new NotiEvent(NotiEvent.TOWER_REQUEST, [0]));
                    userProxy.userData.isTaskHookAdd == 0;
                }
                userProxy.userData.isAutoHook = 0;
                service.doTaskRequestHook(body as Array);
                break;
            case NotiEvent.TASK_REQUEST_HOOK_STOP:
                service.doTaskRequestHookStop([]);
                if (userProxy.userData.taskHookState == 1) {
                    userProxy.userData.taskHookState = 2;
                }
                dispatch(new NotiEvent(NotiEvent.HOOK_MINICLOSE));
//					Alert.show(RedSparkManager.ROOT, LangTxt.HOOK_STOP_ALERT, " ", [LangTxt.OK, LangTxt.CANCEL],onTaskRequestHookStop);
                break;
            case NotiEvent.TASK_REQUEST_HOOK_ADD:
                userProxy.userData.taskHookState = 1;
                service.doTaskRequestHookAdd(body as Array);
                break;
            case NotiEvent.TOWER_REQUEST:
                var iservice:EndlessTowerService = facade.retrieveProxy(EndlessTowerService.NAME) as EndlessTowerService;
                iservice.sendEndLessCmd(body as Array);
                break;
            case NotiEvent.XMAS_HIDEANDSEEK__OPENDIALOG:
                var action:MenuWindowVO = new MenuWindowVO(MenuWinType.HideAndSeekTaskNpcView, MenuWindowVO.OPEN);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, action));
                break;
            case NotiEvent.RED_NPC_VIEW:
                var action2:MenuWindowVO = new MenuWindowVO(MenuWinType.REDENVELOPE_NPC_VIEW, MenuWindowVO.OPEN);
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, action2));
                break;
        }
    }



    private function onTaskRequestHookStop(type:String):void {
        if (type == LangTxt.OK) {
            service.doTaskRequestHookStop([]);
        }
        return;
    }
}
}
