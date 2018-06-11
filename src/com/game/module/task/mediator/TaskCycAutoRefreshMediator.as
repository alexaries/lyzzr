/**
 * Created by huangcb on 2017/9/12.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.hotel.events.CalculatorEvent;
import com.game.module.task.view.TaskCycAutoRefreshView;
import com.game.module.task.vo.TaskCycVo;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskCycAutoRefreshMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskCycAutoRefreshMediator";

    private function get view():TaskCycAutoRefreshView {
        return getViewComponent() as TaskCycAutoRefreshView;
    };
    public function TaskCycAutoRefreshMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {
        view.numClick.getSignal(this).listen(onClickNumBtn);
        view.refreshClick.getSignal(this).listen(onClickRefreshBtn);
    }

    private function onClickNumBtn():void {
        dispatch(new Notification(NotiEvent.SHOW_CALCULATOR));
    }

    //3-蓝色 4-紫色 5-橙色
    private function onClickRefreshBtn(quality:int, num:int):void {
        trace("TODO==师门任务的刷新！")
        vo.color=quality;
        vo.num=num;
        dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [vo.cyc, 3, vo.color + 1, vo.num]));
    }

    private function get vo(): TaskCycVo{
        return view.vo;
    }


    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [CalculatorEvent.NOTIFY_NUM];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case CalculatorEvent.NOTIFY_NUM:
                var n = body;
                handleNum(n._num);
                break;
        }
    }

    //处理得到的num
    private function handleNum(num):void {
        trace("返回了虚拟数字:" + num);
        view.onNotifyNum(num);
    }
}
}