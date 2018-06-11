/**
 * Created by dingcj on 2017/9/26.
 */
package com.game.module.task.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.view.TaskKeepView;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.UserData;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskKeepMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskKeepMediator";

    private var userData:UserData;

    private function get view():TaskKeepView {
        return getViewComponent() as TaskKeepView;
    };
    public function TaskKeepMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        userData = (facade.retrieveProxy(UserProxy.NAME) as UserProxy).userData;
        view.closeClick.getSignal(this).listen(onClickClose);
    }

    private function onClickClose():void {
        dispatch(new Notification(TaskEvent.DO_TASKHOOK_CLOSE));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
        }
    }
}
}