/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.proxy.TaskCycProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.view.TaskCycView;
import com.game.module.task.vo.TaskCycVo;
import com.game.module.task.vo.item.TaskCycItemVo;
import com.game.module.user.proxy.UserProxy;

import lang.LangTxt;
import lang.SystemInfo;

import laya.utils.Handler;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

import utils.StringUtil;

public class TaskCycMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskCycMediator";
    public var vo : TaskCycVo;
    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }
    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }
    function  get  service():TaskCycProxy {
        return facade.retrieveProxy(TaskCycProxy.NAME) as TaskCycProxy;
    }
    private function get dailyVo():DailyVo {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo.vo;
    }
//高级任务
    private function get view():TaskCycView {
        return getViewComponent() as TaskCycView;
    };
    public function TaskCycMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        vo=service.taskCycVo;
        view.dailyVo=dailyVo;
        view.vo=vo;
        view.freeClickSignal.getSignal(this).listen(doViewBtnFreeClick);
        view.goldClickSignal.getSignal(this).listen(doViewBtnGoldClick);
        view.tasksOpenSignal.getSignal(this).listen(doViewTlTasksOpen);
        vo.setMaxCount(userProxy.userVO.gold);
        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 0]));
        refresh();
        userProxy.userData.isInCyc=true;
    }

    override public function onRemove():void {
        userProxy.userData.isInCyc=false;
        taskService.trackAutoTask();
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.TASK_RESPONSE_CYC_FRESH,  NotiEvent.TASK_RESPONSE_GIVE_UP];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case  NotiEvent.TASK_RESPONSE_CYC_FRESH:
                doTaskResponseCycFresh();
                break;
            case  NotiEvent.TASK_RESPONSE_GIVE_UP:
                doTaskResponseGiveUp();
                break;
        }
    }

    private function refresh() : void {

        view.refresh();
        return;
    }



    private function doViewBtnFreeClick( ) : void {
        if(vo.leftCount==TaskCycView.TOTAL_NUM){
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TASK_VIEW_2));
            return;
        }
        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 1]));
        return;
    }

    private function doViewBtnGoldClick( ) : void {
        if (!userProxy.useGold(vo.cost)) {
            return;
        }
//			if (vo.best >= 3) {
//				Alert.show(  "已有高级任务,继续刷新?", " ", ["确定", "取消"], doGoldRefreshOk);
//				return;
//			}
        var str:String = StringUtil.substitute(LangTxt.TASK_CYC_ALERT3,[5]);
        if(vo.flag){
            Alert.show(str, LangTxt.SECRETARY_VIEW_10, [SystemInfo.OK, SystemInfo.CANCEL,LangTxt.OK_NOTIP], Handler.create(this,onViewBtnGoldAlert));
        }else{
            dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 2]));
        }
        return;
    }
    private function onViewBtnGoldAlert(label:String) : void {
        switch( label) {
            case LangTxt.OK_NOTIP:
                vo.flag = false;
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 2]));
                break;
            case SystemInfo.OK:
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 2]));
                break;
        }
    }


    private function doViewTlTasksOpen(itemVo : TaskCycItemVo) : void {
        switch(itemVo.cmd) {
            case 0:
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [itemVo.task.id, 0, 0, 0]));
                break;
            case 1:
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [itemVo.task.id, 1, 0, 0]));
                break;
            case 2:
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [itemVo.task.id, 3, 0, 0]));
                break;
        }
        return;
    }

    private function doTaskResponseCycFresh( ) : void {
        refresh();
        return;
    }

    private function doTaskResponseGiveUp() : void {
        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 0]));
        return;
    }


}
}