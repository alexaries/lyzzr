/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.view.TaskActivityView;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.TimeUtil;

import laya.display.Animation;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;
import org.puremvc.as3.patterns.observer.Notification;

import com.game.utils.ShellUtils;

//DailyView
public class TaskActivityMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskActivityMediator";
    public var vo:DailyVo;

    private function get view():TaskActivityView {
        return getViewComponent() as TaskActivityView;
    }

    private function get dailyVo():DailyVo {
        return dailyService.vo;
    }
    private function get dailyService():DailyService {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo;
    }
    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    public function TaskActivityMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        vo = dailyVo;
        view.vo = vo;
        view.lstLimitActSignal.getSignal(this).listen(doViewLstLimitActOpen)
        view.lstUnlimitedActSignal.getSignal(this).listen(doViewLstUnlimitedActOpen)
        view.timerLoop(1000,this,refresh);
        refresh();
    }

    private function refresh():void {
        view.setlstLimitActProvider(ShellUtils.toDB(vo, vo.actLength));
        view.setlstUnlimitedActProvider(ShellUtils.toDB(vo, vo.act1Length));
        view.refresh(vo.weekTip);
        view.setTimeActIndex(vo.timeActIndex);
    }

    override public function onRemove():void {
        super.onRemove();
        view.clearTimer(this,refresh);
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.USER_LEVEL_UPDATE,
            NotiEvent.DAILY_RESPONSE_DATA];
    }

    private function doViewLstLimitActOpen(dVo:DailyLimitActItemVo):void {
        dispatch(new TaskEvent(TaskEvent.DO_LIMIT_ACT_OPEN, dVo));
    }

    private function doViewLstUnlimitedActOpen(dVo:DailyUnlimitedActItemVo):void {
        dispatch(new TaskEvent(TaskEvent.DO_UNLIMIT_ACT_OPEN, dVo));
    }



    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case    NotiEvent.USER_LEVEL_UPDATE:
                onUserLevelUpdate();
                break;
            case    NotiEvent.DAILY_RESPONSE_DATA:
                doDailyResponseData();
                break;
        }
    }


    private function doDailyResponseData():void {

        refresh();
        return;
    }



    private function onUserLevelUpdate():void {
        refresh();
    }
}
}