package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.proxy.TaskCycProxy;
import com.game.module.task.proxy.TaskDialogProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.struct.TaskBuildStruct;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskDialogItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.ShellUtils;
import com.game.vo.MenuWinType;

import lang.LangTxt;

import net.consts.StaticConfig;
import net.data.structs.task.NpcInteractStruct;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

import utils.HtmlUtil;
import utils.TimerUtil;

public class TaskShellCommand extends BaseCommand implements ICommand {

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }
    function  get  taskCycProxy():TaskCycProxy {
        return facade.retrieveProxy(TaskCycProxy.NAME) as TaskCycProxy;
    }

    function  get  taskDialogProxy():TaskDialogProxy {
        return facade.retrieveProxy(TaskDialogProxy.NAME) as TaskDialogProxy;
    }
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case NotiEvent.GUIDE_TAB_CHANGE:
                doModelBuildChange( );
                break;
            case NotiEvent.TASK_GUIDE_NPC:
                doTaskGuideNpc(body as int);
                break;
            case NotiEvent.TASK_RESPONSE_DIALOG:
                doTaskResponseDialog();
                break;
            case NotiEvent.TASK_RESPONSE_DIALOG_RETURN:
                doTaskResponseDialogReturn();
                break;
            case  NotiEvent.TASK_GUIDE_DLG:
                doTaskGuideDlg(body as TaskDialogItemVo);
                break;

        }

    }

    private function doTaskGuideDlg(itemVo:TaskDialogItemVo):void {
        if (itemVo.talk.interactToken) {
            trace("###################访问对话")
            dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_DIALOG_RETURN, [taskDialogProxy.taskDialogVo.npcId, itemVo.talk.interactId, itemVo.talk.interactType, itemVo.talk.interactStep]));
        } else {
            switch (itemVo.talk.interactId) {
                case 4:
                    taskCycProxy.taskCycVo.cyc = 1;
                    break;
                case 5:
                    taskCycProxy.taskCycVo.cyc = 0;
                    break;
            }
            // 战斗
            if (itemVo.talk.interactId == 1000) {
                dispatch(new NotiEvent(NotiEvent.FIGHT_REQUEST_NPC, [taskDialogProxy.taskDialogVo.npcId]));
            } else if (itemVo.talk.interactId == 1001) {
                // 挂机
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_HOOK, [taskDialogProxy.taskDialogVo.npcId, 0]));
            } else {
                // 功能面板
                if (itemVo.talk.interactId == 5) {
                    var arr:Array = [13315, 13571];
                    if (arr[userProxy.userVO.country] != userProxy.userData.buildId) {
                        dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TASK_CYC_ALERT));
                        return;
                    }
                }
                var win:String = itemVo.func.win;
                switch (win) {
                    case "heroicPropUpdateView":
                        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.USER_INFO,MenuWindowVO.OPEN, 1)));
                        break;
                    default:
                        dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [win]));
                        break;
                }
            }
        }
        return;
    }

    private function doTaskResponseDialog():void {

        taskDialogProxy.taskDialogVo.talks.length>0&&taskDialogProxy.taskDialogVo.talks.forEach(function(nis:NpcInteractStruct){
            if(taskService.getTaskById(nis.interactId)!=null){
                nis.state=taskDialogProxy.getState(taskService.getTaskById(nis.interactId));
                nis.guideState=taskDialogProxy.getGuideState(taskService.getTaskById(nis.interactId));
            }

        })
        dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_DIALOG_VIEW, 1]));
        return;
    }

    private function doTaskResponseDialogReturn():void {
        dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_GUIDE_VIEW, 1]));
        return;
    }

    // 屏蔽弹出
    function doModelBuildChange( ):void {
        if (userProxy.userData.buildId == -1) return;

        var str:String = userProxy.userData.taskGuideArgs;

        if (str) {

            var cmd_arr:Array;
            var cmd:uint;
            var arg_arr:Array;
            var task:TaskVO;
            var build:TaskBuildStruct;
            var npc:TaskNpcStruct;
            cmd_arr = str.split("_");
            cmd = parseInt(cmd_arr[0]);
            // 功能,参数
            switch (cmd) {
                case 0:
                    // 地图
                    arg_arr =  (cmd_arr[1]).split(",");
                    build = ShellUtils.buildById(mapService.mapModel, parseInt(arg_arr[0]));
                    task = taskService.getTaskById(parseInt(arg_arr[1]));
                    npc = ShellUtils.npcInBuildById(mapService.mapModel, parseInt(arg_arr[2]));
                        trace("doModelBuildChange", npc, task, build);
                    if (build.id == userProxy.userData.buildId) {
                        toAutoJoinBuild(npc, task, build);
                    }else{
                        openTaskNpcView();
                    }
                    break;
                case 1:
                    // 菜单
                    break;
                case 2:
                    break;
            }
            userProxy.userData.taskGuideAuto=false;
            userProxy.userData.taskGuideArgs = null;
        }
        else {
            if (userProxy.userData.enterBuildTime +200 > TimerUtil.getTimer()) {
                return;
            }
            openTaskNpcView();
            //弹出
        }
        userProxy.userData.enterBuildTime = TimerUtil.getTimer();
        toGroupInvitAutoJoin();
    }

    public function openTaskNpcView():void {
        //战斗结束会  带body
        if (  TaskUtils.getNpcs(mapService.mapModel, userProxy.userData.buildId).length > 0 && !StaticConfig.welcome) {
            dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_NPC_VIEW, 1]));
        }

    }
    // 调用
    // //
    private function toAutoJoinBuild(npc:TaskNpcStruct, task:TaskVO, build:TaskBuildStruct):void {
      //  var npcList:Array = ShellUtils.npcListInBuild(mapService.mapModel, build.id);

       //if (npcList.indexOf(npc.id) == -1) return;
        //修改
        if(npc.buildId!=build.id ) return;
        switch (task.state) {
            case 0:
                if (task.cfg.npcPublishID == npc.id || task.cfg.npcFinishID == npc.id) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TASK_ALERT));
                } else {
                    toAutoNpcFight(npc);
                }
                break;
            case 1:
                if (task.cfg.npcFinishID == npc.id) {
                        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_DIALOG_RETURN, [npc.id, task.taskId, 1, 10]));
                } else if (task.cfg.npcPublishID == npc.id) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TASK_ALERT1));
                } else {
                    toAutoNpcFight(npc);
                }
                break;
            case 2:
                if (task.cfg.npcPublishID == npc.id) {
                  //  if(userProxy.userData.taskGuideAuto){
                    //    doTaskGuideNpc(npc.id);
                   // }else {
                        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_DIALOG_RETURN, [npc.id, task.taskId, 1, 1]));
                   // }
                } else if (task.cfg.npcFinishID == npc.id) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TASK_ALERT2));
                } else {
                    toAutoNpcFight(npc);
                }
                break;
        }

        return;
    }

    private function toAutoNpcFight(npc:TaskNpcStruct):void {
        switch (npc.type) {
            case 2:
                if (npc.level > 30 && npc.level <= userProxy.userVO.level) {
                    taskDialogProxy.taskDialogVo.npcId = npc.id;
                    taskDialogProxy.taskDialogVo.talks = [];
                    dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_DIALOG, []));
                } else {
                    if (userProxy.userData.enterBuildTime +200 > TimerUtil.getTimer()) {
                        return;
                    }
                    dispatch(new NotiEvent(NotiEvent.FIGHT_REQUEST_NPC, [npc.id]));
                }
                break;
            case 1:
            case 6:
                if (userProxy.userData.enterBuildTime +200 > TimerUtil.getTimer()) {
                    return;
                }
                dispatch(new NotiEvent(NotiEvent.FIGHT_REQUEST_NPC, [npc.id]));
                break;
        }
        return;
    }

//    function  get  groupVo():GroupCopyVO {
//        var groupService:GroupService = facade.retrieveProxy(GroupService.NAME) as GroupService;
//        return groupService.vo;
//    }

    private function toGroupInvitAutoJoin():void {

//        if (groupVo.invitCopyId > 0) {
//            var copy:Object= groupVo.copys[groupVo.invitCopyId - 1] as Object;
//            if (groupVo.copyId == 0) {
//                this.dispatch(new NotiEvent(NotiEvent.GROUP_COPY_REQUEST_LOBBY_JOIN, [0, groupVo.invitCopyId, groupVo.invitCopyState]));
//            } else {
//                if (groupVo.state == groupVo.invitCopyState) {
//                } else {
//                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.GROUP_ALERT2));
//                }
//            }
//            if (groupVo.roomId > 1) {
//                if (groupVo.roomId == groupVo.invitRoomId) {
//                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.GROUP_ALERT3));
//                } else {
//                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.GROUP_ALERT1));
//                }
//            } else {
//                this.dispatch(new NotiEvent(NotiEvent.GROUP_COPY_REQUEST_ROOM_JOIN, [groupVo.invitRoomId, ""]));
//            }
//            groupVo.joinRoomId = groupVo.invitRoomId;
//            groupVo.invitCopyId = 0;
//            groupVo.invitCopyState = 0;
//            groupVo.invitRoomId = 0;
//        }

        return;
    }

    private function doTaskGuideNpc(npcId:uint):void {
      //  var npc:TaskNpcStruct = ShellUtils.npcById(npcId);
        var npc:TaskNpcStruct = ShellUtils.npcInBuildById(mapService.mapModel, npcId);
        if (npc) {
            switch (npc.type) {
                case 0:
                    dispatch(new NotiEvent(NotiEvent.ROLL_SCREEN, HtmlUtil.shiftColorText("#FFFF99" + "目标不存在！", false, true)));
                    break;
                case 2:
                    toAutoNpcFight(npc);
                    break;
                case 4:
                    this.dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_DIALOG, [npc.id]));
                    break;
                case 6:
                    toAutoNpcFight(npc);
                    break;
                //捉迷藏
                case 100:
                    this.dispatch(new NotiEvent(NotiEvent.XMAS_HIDEANDSEEK__OPENDIALOG));
                    break;
                //玫瑰精灵
                case 101:
                    var action:MenuWindowVO = new MenuWindowVO(MenuWinType.ACTIVITY_SPRITE_FIND,MenuWindowVO.OPEN);
                    dispatch(new MenuEvent(MenuEvent.MENU_CLIK, action));
                    break;
                //红包使者
                case 102:
                    this.dispatch(new NotiEvent(NotiEvent.RED_NPC_VIEW));
                    break;
            }
        }
        return;
    }


}
}
