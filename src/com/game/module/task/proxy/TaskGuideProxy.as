/**
 * Created by huangcb on 2017/9/29.
 */
package com.game.module.task.proxy {
import com.game.events.NotiEvent;
import com.game.module.task.vo.TaskGuideVo;
import com.game.vo.TaskCfg;

import globals.ConfigLocator;

import net.data.recvMsg.task.NpcInteractMsg;

import org.puremvc.as3.interfaces.IProxy;
import com.game.common.mvc.BaseProxy;

public class TaskGuideProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskGuideProxy";


    public var taskGuideVo:TaskGuideVo;
    public function TaskGuideProxy() {
        super(NAME);


        taskGuideVo = new TaskGuideVo();

    }

    public function doTaskResponseDialogReturn(evt:Object):void {
        trace("doResponseTaskDialogReturn"+evt);
        var msg:NpcInteractMsg = evt as NpcInteractMsg;
        taskGuideVo.npcId = msg.npcId;
        taskGuideVo.msg = msg.npcMsg;
        taskGuideVo.talk = msg.npcInteractStruct;
        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_DIALOG_RETURN, []));
        return;
    }

    public function checkGuide(taskID:int): Boolean{
        var task:TaskCfg = ConfigLocator.getInstance().taskDic.get(taskID);
        var cg=( taskGuideVo.npcId==task.npcFinishID||taskGuideVo.npcId==task.npcPublishID) ;
        return cg;
    }
}
}