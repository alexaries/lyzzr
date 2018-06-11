/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.proxy.TaskGuideProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.view.TaskGuideView;
import com.game.module.task.vo.TaskGuideVo;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskType;
import com.game.module.task.vo.TaskVO;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.UserData;

import globals.ConfigLocator;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

import utils.TimerUtil;

public class TaskGuidMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskGuidMediator";
    public var timeEnd:int;
    private function get dailyVo():DailyVo {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo.vo;
    }

    private function get vo():TaskGuideVo {
        return service.taskGuideVo;
    }

    private function get service():TaskGuideProxy {
        var __vo:TaskGuideProxy = facade.retrieveProxy(TaskGuideProxy.NAME) as TaskGuideProxy;
        return __vo;
    }

    private function get taskService():TaskService {
        var __vo:TaskService = facade.retrieveProxy(TaskService.NAME) as TaskService;
        return __vo;
    }


    private function get userData():UserData {
        return userProxy.userData;
    }

    private function get userProxy():UserProxy {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        return userProxy;
    }

    private function get view():TaskGuideView {
        return getViewComponent() as TaskGuideView;
    };
    public function TaskGuidMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        timeEnd=TimerUtil.getTimer();
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
//        view.closeFuncEnable = userProxy.userVO.level > 45;
        view.closeFuncEnable = true;

        view.data = vo;
        view.onBtnFinishSignal.getSignal(this).listen(onBtnFinish);
        view.onLabClickSignal.getSignal(this).listen(onLabClick)
        refresh();
        trace("TaskGuidMediator onRegister", vo)
        //vip设置
        // if ((int(userData.vipCfgs[8]) == 1||NoviceVIPProxy.canClanTaskFinish)&&vo.task&&vo.task.type>3&&vo.task.state!=1) {
        //    vo.canFinish = true;
        // }
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.TASK_RESPONSE_DIALOG_RETURN];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.TASK_RESPONSE_DIALOG_RETURN:
                doTaskResponseDialogReturn();
                break;
        }
    }

    private function refresh():void {
        view.refresh();
        return;
    }

    private function doTaskResponseDialogReturn():void {
        refresh();
        return;
    }

    private function onLabClick():void {

        if(  TimerUtil.getTimer()-timeEnd<1000){
           // return;
        }
        dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_GUIDE_VIEW, 0]));

        var taskVo:TaskVO=taskService.getTaskById(vo.talk.interactId) as TaskVO;
        var goods_id:int = 0;
        var goods_num:int = 0;
            if (taskVo && taskVo.state ==TaskState.RESOLVED) {
                switch (vo.talk.interactId) {
                    case 19:
                        switch (userData.userVO.career) {
                            case 0:
                                goods_id = 1600;
                                goods_num = 1;
                                break;
                            case 1:
                                goods_id = 1601;
                                goods_num = 1;
                                break;
                            case 2:
                                goods_id = 1602;
                                goods_num = 1;
                                break;
                        }
                        break;
                    case 70:
                        switch (userData.userVO.career) {
                            case 0:
                                goods_id = 4997;
                                goods_num = 1;
                                break;
                            case 1:
                                goods_id = 4998;
                                goods_num = 1;
                                break;
                            case 2:
                                goods_id = 4999;
                                goods_num = 1;
                                break;
                        }
                        break;
                }
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [vo.talk.interactId, 1, goods_id, goods_num]));
                trace("onLabClick 1", vo.talk.interactId, 1, goods_id, goods_num)
                // return;
            }


        var taskVO:TaskVO=taskService.getTaskById(vo.talk.interactId);
        if (taskVO&&(taskVO.state==TaskState.WAIT ||taskVO.state==TaskState.PENDING )) {
            if (vo.talk.interactStep == 0) {
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [vo.talk.interactId, 0, 0, 0]));
                if (userData.autoFightIds.indexOf((vo.talk.interactId)) > -1) {
                    var t:int = ConfigLocator.getInstance().autoFightDic.get(vo.talk.interactId);
                    this.dispatch(new NotiEvent(NotiEvent.FIGHT_REQUEST_NPC, [t]));
                }
                trace("onLabClick 2")
            } else {
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_DIALOG_RETURN, [vo.npcId, vo.talk.interactId, vo.talk.interactType, vo.talk.interactStep]));
                trace("onLabClick 3")
            }
            //  return;
        }
        trace("onLabClick 4")
        //  taskService.trackMainTask();

        return;
    }


    private function onBtnFinish():void {
        if (vo.task)
            dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [vo.task.id, 3, 0, 0]));
        return;
    }
}
}