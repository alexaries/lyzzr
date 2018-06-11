/**
 * Created by huangcb on 2017/9/28.
 */
package com.game.module.worldMap.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class WorldMapEvent extends Notification implements INotification {
    public static const DELIVER : String = "DELIVER";

    public function WorldMapEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}