/**
 * Created by huangcb on 2017/9/12.
 */
package com.game.module.task.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskEvent extends Notification implements INotification {
    public static const DO_LIMIT_ACT_OPEN:String = "DO_LIMIT_ACT_OPEN";
    public static const DO_UNLIMIT_ACT_OPEN:String = "DO_UNLIMIT_ACT_OPEN";
    public static const DO_TASKHOOK_CLOSE:String = "DO_TASKHOOK_CLOSE";

    public function TaskEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}