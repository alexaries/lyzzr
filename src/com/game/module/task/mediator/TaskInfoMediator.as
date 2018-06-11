/**
 * Created by huangcb on 2017/9/12.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.task.view.TaskInfoView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

public class TaskInfoMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskInfoMediator";

    private function get view():TaskInfoView {
        return getViewComponent() as TaskInfoView;
    }
    public function TaskInfoMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.SHOW_FRAME_MSG];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.SHOW_FRAME_MSG:
                view.setMsg(body as String);
                break;
        }
    }
}
}