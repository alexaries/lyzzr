/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.view.TaskActivityTrackView;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.TimeUtil;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskActivityTrackMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskActivityTrackMediator";
    private var vo:DailyVo;


    private function get dailyVo():DailyVo {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo.vo;
    }


    private function get userProxy():UserProxy {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        return userProxy;
    }

    private function get view():TaskActivityTrackView {
        return getViewComponent() as TaskActivityTrackView;
    };
    public function TaskActivityTrackMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        var dailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        vo = dailyService.vo;
        view.lstLimitActSignal.getSignal(this).listen(doViewLstLimitActOpen)
        view.lstUnlimitedActSignal.getSignal(this).listen(doViewLstUnlimitedActOpen)
        view.timerLoop(1000,this,refresh)
    }

    override public function onRemove():void {
        super.onRemove();
        view.clearTimer(this,refresh)
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.USER_LEVEL_UPDATE,
            NotiEvent.DAILY_RESPONSE_DATA];
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


    private function refresh():void {
        if(vo.timeActIndex == -1){
            return;
        }
        var tmp:Array = [];
        for (var i:int = 0; i < vo.actLength; i++) {

            var object:DailyLimitActItemVo = new DailyLimitActItemVo();
            object.dataVo = vo;
            object.index = i;
            tmp.push(object);

        }

        for (var j:int = 0; j < vo.act1Length; j++) {
            var object1:DailyUnlimitedActItemVo = new DailyUnlimitedActItemVo();
            object1.dataVo = vo;
            object1.index = i;

            tmp.push(object1);
        }
        view.setActProvider([tmp[vo.timeActIndex]]);
        view.refresh();
    }


    private function doDailyResponseData():void {

        refresh();
// vo.sendState == 1 ?
        return;
    }

    private function doViewLstLimitActOpen(dVo:DailyLimitActItemVo):void {
        dispatch(new TaskEvent(TaskEvent.DO_LIMIT_ACT_OPEN, dVo));
    }

    private function doViewLstUnlimitedActOpen(dVo:DailyUnlimitedActItemVo):void {
        dispatch(new TaskEvent(TaskEvent.DO_UNLIMIT_ACT_OPEN, dVo));
    }




    private function onUserLevelUpdate():void {
        refresh();
    }
}
}