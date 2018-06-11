/**
 * Created by huangcb on 2017/9/29.
 */
package com.game.module.task.proxy {
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.task.vo.TaskCycVo;
import com.game.module.task.vo.TaskVO;
import com.game.module.user.proxy.UserProxy;

import config.ConfigManager;
import config.mission.task.ITask_tasks;
import config.mission.task.ITask_tasks_item;

import net.data.recvMsg.task.TaskCycFreshMsg;

import net.data.recvMsg.task.TaskCycFreshVOMsg;

import org.puremvc.as3.interfaces.IProxy;
import com.game.common.mvc.BaseProxy;

import utils.ArrayUtil;

public class TaskCycProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskCycProxy";




    public var taskCycVo:TaskCycVo;

    public function TaskCycProxy() {
        super(NAME);
        // 取

        taskCycVo = new TaskCycVo();
    }

    public function doTaskResponseCycFresh(evt:Object):void {

        var msg:TaskCycFreshMsg = evt as TaskCycFreshMsg;

        taskCycVo.vipCfgs=userProxy.userData.vipCfgs;
        if(taskCycVo.cyc==msg.cyc){
            taskCycVo.refreshCount = msg.refreshCount;
            taskCycVo.finishCount = msg.finishCount;
            taskCycVo.leftCount = msg.leftCount;
            for (var i:int = 0; i < msg.tasks.length; i++) {
                var taskCycFreshVOMsg:TaskCycFreshVOMsg = msg.tasks[i];
                taskCycFreshVOMsg.level=userProxy.userVO.level;
            }
            taskCycVo.tasks = msg.tasks; 
            dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_CYC_FRESH));
        }
        else
        {
        }

        return;
    }
    private function get userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

}
}