/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.task.proxy.TaskCycProxy;
import com.game.module.task.proxy.TaskDialogProxy;
import com.game.module.task.proxy.TaskGuideProxy;
import com.game.module.task.proxy.TaskHookProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.user.proxy.UserProxy;

import net.data.recvMsg.task.CurrAvailableTaskMsg;
import net.data.recvMsg.task.TaskActionMsg;

import net.data.recvMsg.task.TaskUpdateMsg;
import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskMsgCommand extends BaseCommand implements ICommand {
    function  get  service():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    function  get  taskHookProxy():TaskHookProxy {
        return facade.retrieveProxy(TaskHookProxy.NAME) as TaskHookProxy;
    }
    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }
    function  get  taskCycProxy():TaskCycProxy {
        return facade.retrieveProxy(TaskCycProxy.NAME) as TaskCycProxy;
    }

    function  get  taskGuideProxy():TaskGuideProxy {
        return facade.retrieveProxy(TaskGuideProxy.NAME) as TaskGuideProxy;
    }

    function  get  taskDialogProxy():TaskDialogProxy {
        return facade.retrieveProxy(TaskDialogProxy.NAME) as TaskDialogProxy;
    }


    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        trace(notification);
        switch (name) {

            case MsgEvent.GET_TASK_LIST:
                service.doResponseTaskCurrList(body);
                if(userProxy.userVO.level<2){
                    service.trackAutoTask();
                }else{
                    service.trackShowAutoTask();
                }
                break;
            case MsgEvent.GET_USABLE_TASK:
                var msg:CurrAvailableTaskMsg = body as CurrAvailableTaskMsg;

                var trackAuto:Boolean=service.tasks.length==0&&msg.getAvalibleTaskVO().length>0
                service.doTaskResponseAcceptList(msg);
                if(trackAuto&&userProxy.userVO.level<2){
                    service.trackAutoTask();
                }else{
                    service.trackShowAutoTask();
                }
                break;
            case MsgEvent.PLAYER_ABANDON_TASK:
                var msgbody:TaskActionMsg = body as TaskActionMsg;
                service.doTaskResponseGiveUp(msgbody);
                if(msgbody.action==1&&userProxy.userVO.level<2){
                  //  service.trackAutoTask();
                }else if(msgbody.action!=1&& msgbody.action!=3){
                   // service.trackAutoTask();
                }else{

                }
                service.trackShowAutoTask();
                break;
            case MsgEvent.DIALOG_START:
                taskDialogProxy.doTaskResponseDialog(body);

                break;
            case MsgEvent.DIALOG_INTERACTION:
                taskGuideProxy.doTaskResponseDialogReturn(body);
                break;

            case MsgEvent.UPDATE_TASK_PROCESS:
                var msg2:TaskUpdateMsg = body as TaskUpdateMsg;
                service.doResponseTaskCurrListUpdate(msg2);
               if (msg2.taskItem&&msg2.taskValue) {
                   // service.trackAutoTask();
               }
               service.trackShowAutoTask();

                break;
            case MsgEvent.NEW_TASK:
                service.doResposeNewTask(body);
                break;
            case MsgEvent.TASK_CYC_FRESH:
                taskCycProxy.doTaskResponseCycFresh(body);
                break;
            case MsgEvent.TASK_RESPONSE_HOOK:
                taskHookProxy.doTaskResponseHook(body);
                break;
        }
    }
}
}
