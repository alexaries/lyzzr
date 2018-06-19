/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.ShellUtils;
import com.game.vo.UserData;
import com.talkingdata.TDItem;
import com.talkingdata.TDManager;

import config.ConfigManager;

import net.data.recvMsg.task.CurrAvailableTaskMsg;
import net.data.recvMsg.task.CurrTaskListMsg;
import net.data.recvMsg.task.NewTaskMsg;
import net.data.recvMsg.task.TaskActionMsg;
import net.data.recvMsg.task.TaskUpdateMsg;
import net.data.sendCmd.task.CurrAvailableTaskCmd;
import net.data.sendCmd.task.CurrTaskListCmd;
import net.data.sendCmd.task.DialogStartCmd;
import net.data.sendCmd.task.NpcInteractCmd;
import net.data.sendCmd.task.TaskActionCmd;
import net.data.sendCmd.task.TaskCycFreshCmd;
import net.data.sendCmd.task.TaskHookAddCmd;
import net.data.sendCmd.task.TaskHookCmd;
import net.data.sendCmd.task.TaskHookStopCmd;
import net.data.structs.task.AvailableTask;
import net.data.structs.task.TaskStruct;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.IProxy;

import utils.ArrayUtil;

public class TaskService extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskService";

    private var connection:SocketConnectionProxy;

    public var tasks:Vector.<TaskVO>;
    public var gotoTaskId:uint;
    public var guideTaskId:uint;

    public function TaskService() {
        super(NAME);


        tasks = new Vector.<TaskVO>();

        connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;

    }


    public function get userData():UserData {
        return userProxy.userData;
    }

    public function get userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;

    }

    public function createTaskById(id):TaskVO {
        var taskVO:TaskVO = new TaskVO()
        taskVO.taskId = id;

        return taskVO;
    }

    public function getTaskById(id):TaskVO {
        var taskVO:TaskVO = ArrayUtil.find(tasks, function (t:TaskVO) {
            return t.taskId == id;
        });

        return taskVO;
    }
    public function trackShowAutoTask():TaskVO {

        //主线
        var mainTaskVO:TaskVO = getMainTaskVO();
        if (mainTaskVO) {
            guideTaskId = mainTaskVO.taskId;
            trace("##########################mainTaskVO", mainTaskVO);
            dispatch(new NotiEvent(NotiEvent.TASK_REFRESH_INIT, mainTaskVO));
            return mainTaskVO;
        }
        var body :TaskTrackItemVo=new TaskTrackItemVo();
        body.tipArray=[
            "日常",
            "完成每日任务获取丰厚奖励"
        ] ;
        body.tips="日常";
        dispatch(new NotiEvent(NotiEvent.TASK_REFRESH, body));
        //使用 活跃度
        return null;

        //no use
        var tasklist:Array = taskLists ;
        if(tasklist.length==0){
            var body :TaskTrackItemVo=new TaskTrackItemVo();
            body.tipArray=[
                "日常",
                "完成每日任务获取丰厚奖励"
            ] ;
            body.tips="日常";
            dispatch(new NotiEvent(NotiEvent.TASK_REFRESH, body));
            //使用 活跃度
            return null;
        }
        var userLevel:int = userProxy.userVO.level;
        //单选
        var gotoTaskVO:TaskVO = getGotoTaskVO();
        if (gotoTaskVO && userLevel > 38) {
            trace("##########################gotoTaskVO", gotoTaskVO);
            dispatch(new NotiEvent(NotiEvent.TASK_REFRESH_INIT, gotoTaskVO));
            return gotoTaskVO;
        }
        //主线
        var mainTaskVO:TaskVO = getMainTaskVO();
        if (mainTaskVO) {
            guideTaskId = mainTaskVO.taskId;
            trace("##########################mainTaskVO", mainTaskVO);
            dispatch(new NotiEvent(NotiEvent.TASK_REFRESH_INIT, mainTaskVO));
            return mainTaskVO;
        }
        return null;
    }
    public function trackAutoTask():void {

        if(userData.userVO.level>3){
            if (userData.isInFight
                    || userData.isInCopy
                    || userData.isInBabel
                    || userData.isInFormation
                    || userData.isInHotel
                    || userData.isInChapter
                    || userData.isInCyc
            ){
                return;
            }
        }

        var trackTaskVO:TaskVO = trackShowAutoTask() ;
        if (trackTaskVO) {
            guideTaskId = trackTaskVO.taskId;
            dispatch(new NotiEvent(NotiEvent.INIT_TASK, trackTaskVO));
            return;
        }

    }

    public function getMainTaskVO():TaskVO {
        //主线只有一个 先查可接 再查当前
        var tmp:Array =taskLists.filter(function (taskVO:TaskVO) {
            return taskVO.type == 1;
        })
        if (tmp.length > 0) {
            return tmp[0];
        }
        return null;
    }

    public function getGotoTaskVO():TaskVO {
        if (gotoTaskId != 0) {
            return getTaskById(gotoTaskId);
        }
        return null;
    }

    public function get taskLists():Array {
        return    ArrayUtil.sortOn(tasks, ["stateType", "type", "taskId"]);
    }


    //当前任务
    public function doResponseTaskCurrList(evt:Object):void {
        trace("##########################当前任务", evt);
        var msg:CurrTaskListMsg = evt as CurrTaskListMsg;
        var list:Array = msg.getCurrTaskListVO();
        var item:TaskStruct;
        var taskVo:TaskVO;
        for (var i:uint = 0; i < list.length; i++) {
            item = list[i] as TaskStruct;
            taskVo = getTaskById(item.taskId) as TaskVO;
            if (taskVo==null) {
                taskVo=createTaskById(item.taskId);
                tasks.push(taskVo);
            }
            taskVo.plan = item.stepList;
            taskVo.state = item.isCompleted;
        }
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_CURR_LIST, []));

        return;
    }

    //可接任务
    public function doTaskResponseAcceptList(evt:CurrAvailableTaskMsg):void {
        trace("#########################可接任务", evt);
        var list:Array = evt.getAvalibleTaskVO();
        var item:AvailableTask;
        var taskVo:TaskVO;

        for (var i:uint = 0; i < list.length; i++) {
            item = list[i] as AvailableTask;
            taskVo = getTaskById(item.taskId) as TaskVO;
            if (taskVo==null) {
                taskVo=createTaskById(item.taskId);
                tasks.push(taskVo);
            }
            taskVo.plan = ShellUtils.toNStr("0", taskVo.plan.length).split("");
            taskVo.state = TaskState.WAIT;
        }
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_ACCEPT_LIST, []));
        return;
    }

    /**
     * (S->C) 0x85 玩家接受、提交、放弃某任务请求
     * 0:任务接受,1:任务提交,2:任务放弃,3:付费提交
     */
    public function doTaskResponseGiveUp(msg:TaskActionMsg):void {
        trace("######################### 玩家接受、提交、放弃某任务请求", msg);

        switch (msg.action) {
            case 0:
                break;
            case 1:
            case 2:
            case 3:
                break;
        }
        this.dispatch(new NotiEvent(NotiEvent.DAILY_REQUEST_DATA, []));
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_GIVE_UP, [msg.action, msg.taskId]));


    }
    //任务状态更新
    public function doResponseTaskCurrListUpdate(msg:TaskUpdateMsg):void {
        trace("#########################任务状态更新", msg);

        var taskVo:TaskVO = getTaskById(msg.flowId) as TaskVO;
        if (taskVo) {
            if (msg.taskItem) {
                taskVo.state = msg.taskValue;
                if (taskVo.state == TaskState.RESOLVED) {
                    dispatch(new NotiEvent(NotiEvent.TASK_COMPLETE, [taskVo.taskId]));

                    tdResolvedTask(taskVo);
                    Alert.roll(taskVo.cfg.name + "任务完成")
                }

            } else {
                taskVo.plan[msg.taskStepType - 1] = msg.taskValue;
            }
        }
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_CURR_LIST_UPDATE, []));
    }

    //新增任务
    public function doResposeNewTask(evt:Object):void {
        trace("#########################新增任务", evt);
        var msg:NewTaskMsg = evt as NewTaskMsg;
        var taskVo:TaskVO = getTaskById(msg.newTask.taskId) as TaskVO;
        if (taskVo==null) {
            taskVo=createTaskById(msg.newTask.taskId);
            tasks.push(taskVo);
        }
        taskVo.state = TaskState.PENDING;
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_NEW_TASK, msg));

        return;
    }
    public function tdResolvedTask(taskVo:TaskVO):void {
        if (taskVo.type == 1) {
            //完成主线任务ID统计
            TDManager.addEvent(TDItem.zhuxianrenwuwancheng, {taskId: taskVo.taskId + ""}, "主线任务");
        }
        else if (taskVo.type == 2) {
            //完成师门任务统计
            TDManager.addEvent(TDItem.meiriwanchengshimencishu, {count: 1}, "师门任务");
            if (taskVo.cycColor == 2) {
                //紫色任务统计
                TDManager.addEvent(TDItem.meiriwanchengziseshimencishu, {count: 1}, "师门任务");
            }
            else if (taskVo.cycColor == 3) {
                //金色任务统计
                TDManager.addEvent(TDItem.meiriwanchengjinseshimencishu, {count: 1}, "师门任务");
            }
        }
        else if (taskVo.type == 3) {
            //完成衙门任务统计
            TDManager.addEvent(TDItem.meiriwanchengyamencishu, {count: 1}, "衙门任务");
            if (taskVo.cycColor == 2) {
                //紫色任务统计
                TDManager.addEvent(TDItem.meiriwanchengziseyamencishu, {count: 1}, "衙门任务");
            }
            else if (taskVo.cycColor == 3) {
                //金色任务统计
                TDManager.addEvent(TDItem.meiriwanchengjinseyamencishu, {count: 1}, "衙门任务");
            }
        }
    }




    // 发
    public function doTaskRequestAcceptList(args:Array = null):void {
        var cmd:CurrAvailableTaskCmd = new CurrAvailableTaskCmd();
        connection.send(cmd);
        return;
    }

    public function doTaskRequestCurrList(args:Array = null):void {
        var cmd:CurrTaskListCmd = new CurrTaskListCmd();
        connection.send(cmd);
        return;
    }

    public function doTaskRequestGiveUp(args:Array):void {
        var cmd:TaskActionCmd = new TaskActionCmd;
        cmd.taskId = args[0];
        cmd.action = args[1];
        cmd.itemId = args[2];
        cmd.awardNums = args[3];
        connection.send(cmd);
        return;
    }

    public function doTaskRequestDialog(args:Array):void {
        var cmd:DialogStartCmd = new DialogStartCmd;
        cmd.npcId = args[0];
        connection.send(cmd);
        return;
    }

    public function doTaskRequestDialogReturn(args:Array):void {
        var cmd:NpcInteractCmd = new NpcInteractCmd();
        cmd.npcId = args[0];
        cmd.interactId = args[1];
        cmd.interactType = args[2];
        cmd.interactStep = args[3];
        trace(cmd);
        connection.send(cmd);
        return;
    }

    public function doTaskRequestCycFresh(args:Array):void {


        var cmd:TaskCycFreshCmd = new TaskCycFreshCmd();
        cmd.cyc = args[0];
        cmd.type = args[1];
        if (cmd.type == 3) {
            cmd.color = args[2];
            cmd.count = args[3];
        }

        if (cmd.type == 2) {
            TDManager.addEvent(TDItem.meirishimenshuaxincishu, {count: 1}, "师门任务");
        }
        else if (cmd.type == 3) {
            TDManager.addEvent(TDItem.meirishuaxinyamencishu, {count: 1}, "衙门任务");
        }
        connection.send(cmd);
        return;
    }

    public function doTaskRequestHook(args:Array):void {
        var cmd:TaskHookCmd = new TaskHookCmd();
        cmd.npcId = args[0];
        cmd.state = args[1];
        connection.send(cmd);
        return;
    }

    public function doTaskRequestHookStop(args:Array):void {
        var cmd:TaskHookStopCmd = new TaskHookStopCmd();
        connection.send(cmd);
        return;
    }

    public function doTaskRequestHookAdd(args:Array):void {
        var cmd:TaskHookAddCmd = new TaskHookAddCmd();
        connection.send(cmd);
        return;
    }

    private function get taskDialogProxy():TaskDialogProxy {
        return facade.retrieveProxy(TaskDialogProxy.NAME) as TaskDialogProxy;
    }

    private function get taskGuideProxy():TaskGuideProxy {
        return facade.retrieveProxy(TaskGuideProxy.NAME) as TaskGuideProxy;
    }
}
}