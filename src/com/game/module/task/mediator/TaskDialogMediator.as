/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.task.proxy.TaskDialogProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.view.TaskDialogView;
import com.game.module.task.vo.item.TaskDialogItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

import utils.TimerUtil;

public class TaskDialogMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskDialogView";

    public var timeEnd:int;
    function  get  taskDialogProxy():TaskDialogProxy {
        return facade.retrieveProxy(TaskDialogProxy.NAME) as TaskDialogProxy;
    }

    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    private function get view():TaskDialogView {
        return getViewComponent() as TaskDialogView;
    };
    public function TaskDialogMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        timeEnd=TimerUtil.getTimer();
//        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
//        view.closeFuncEnable = userProxy.userVO.level > 45;
        view.closeFuncEnable = true;

        refresh();
        view.doTileListOpenSignal.getSignal(this).listen(doTileListOpen);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.TASK_RESPONSE_CURR_LIST_UPDATE,
            NotiEvent.TASK_RESPONSE_ACCEPT_LIST
        ];
    }

    private function refresh():void {
        view.data = taskDialogProxy.taskDialogVo;
        view.refresh();
        return;
    }


    private function doTileListOpen(itemVo:TaskDialogItemVo):void {
        if(  TimerUtil.getTimer()-timeEnd<1000){
          //  return;
        }
        dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_DIALOG_VIEW, 0]));
        dispatch(new NotiEvent(NotiEvent.TASK_GUIDE_DLG, itemVo));
    }


    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.TASK_RESPONSE_CURR_LIST_UPDATE:
            case NotiEvent.TASK_RESPONSE_ACCEPT_LIST:
                refresh();
                break;
        }
    }
}
}