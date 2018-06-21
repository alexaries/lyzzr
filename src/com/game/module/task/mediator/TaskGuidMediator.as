/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.task.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.task.proxy.TaskGuideProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.view.TaskGuideView;
import com.game.module.task.vo.TaskGuideVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.UserData;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import utils.TimerUtil;

public class TaskGuidMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskGuidMediator";
    public var timeEnd:int;

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
    }


    private function onBtnFinish():void {
        if (vo.task)
            dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [vo.task.id, 3, 0, 0]));
        return;
    }
}
}