/**
 * Created by huangcb on 2017/9/29.
 */
package com.game.module.task.proxy {
import com.game.events.NotiEvent;
import com.game.module.task.vo.TaskDialogVo;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskVO;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.TaskCfg;

import globals.ConfigLocator;

import lang.LangTxt;

import net.data.recvMsg.task.DialogStartMsg;
import net.data.structs.task.NpcInteractStruct;

import org.puremvc.as3.interfaces.IProxy;
import com.game.common.mvc.BaseProxy;

public class TaskDialogProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskDialogProxy";
    public var taskDialogVo:TaskDialogVo;

    private function get userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    public function TaskDialogProxy() {
        super(NAME);

        taskDialogVo = new TaskDialogVo();
    }

    public function doTaskResponseDialog(evt:Object):void {
        trace("doResponseTaskDialog");
        var msg:DialogStartMsg = evt as DialogStartMsg;
        taskDialogVo.npcId = msg.npcId;
        taskDialogVo.type = msg.actionType;
        taskDialogVo.talks = getNpcInteractTalks(msg.getNpcInteractVO());//NpcInteractStruct

        dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_DIALOG, []));
        return;
    }

    public function getState(taskVo:TaskVO):String {
        var s:String;
        s = "";
        if (taskVo) {
            /**
             * 任务状态:0未完成，1完成 ,2 可接
             */

                if (taskVo.state==TaskState.RESOLVED) {
                    s = LangTxt.TASK_VIEW_31;
                }
                if (taskVo.state==TaskState.PENDING) {
                    s = LangTxt.TASK_VIEW_32;
                }

            if (taskVo.state==TaskState.WAIT) {
                s = LangTxt.TASK_VIEW_33;
            }
        }
        return s;
    }


    // 0  1   2   3    4    5   6    7
    // 黄？>黄！>蓝？>蓝！>绿！>绿？>灰？
    function getNpcInteractTalks(list:Array):Array {
        var arr:Array = [];
        list.sort(function (a:NpcInteractStruct, b:NpcInteractStruct) {
            var task1:TaskCfg = ConfigLocator.getInstance().taskDic.get(a.interactId);
            var task2:TaskCfg = ConfigLocator.getInstance().taskDic.get(b.interactId);
            var type1:int = task1?task1.type:0;
            var type2:int = task2?task2.type:0;

            return type1 - type2;
        });
        for (var i:int = 0; i < list.length; i++) {
            var item:NpcInteractStruct = list[i] as NpcInteractStruct;
            item.interactToken = 1;
            var task:TaskCfg = ConfigLocator.getInstance().taskDic.get(item.interactId);

            if (task) {
                switch (task.type) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                        arr.push(item);
                        break;
                    case 4:
                    case 5:
                        arr.push(item);
                        break;
                    case 6:
                        arr.push(item);
                        break;
                }
            } else {
                arr.push(item);
            }
        }
        return arr;
    }

    public function checkGuide(taskID:int): Boolean{
        var task:TaskCfg = ConfigLocator.getInstance().taskDic.get(taskID);
        var cg= ( taskDialogVo.npcId==task.npcFinishID||taskDialogVo.npcId==task.npcPublishID);
        return cg;
    }


    public function getGuideState(taskByIdOrNew:TaskVO):Boolean {
        return taskByIdOrNew.cfg.type==1;
    }
}
}