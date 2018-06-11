package com.game.module.user.events {
import org.puremvc.as3.patterns.observer.Notification;

/**
 * @author ryan
 */
public class RoleServiceEvent extends Notification {
    public static const USER_INFO:String = "user_info";

    public function RoleServiceEvent(type:String) {
        super(type);
    }
}
}
