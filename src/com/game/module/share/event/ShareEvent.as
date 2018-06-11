/**
 * Created by guanll on 2018/1/17.
 */
package com.game.module.share.event {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class ShareEvent extends Notification implements INotification {
    public static const SHARE_SUCCESS:String = "share_success";
    public static const SHARE_GET_PRIZE:String = "share_get_prize";
    public static const CONCERN_SUCCESS:String = "concern_success";
    public static const CONCERN_GET_PRIZE:String = "concern_get_prize";
    public static const GET_INFO:String = "get_info";

    public static const GET_MSG_FROM_SERVER:String = "get_msg_from_server";
    public function ShareEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}
