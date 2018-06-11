/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.module.menu.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class MenuEvent extends Notification implements INotification {
    public static const MENU_CLIK:String = "menuClick";
    public static const MENU_EFFECT_START:String = "menuEffectStart";
    public static const MENU_EFFECT_STOP:String = "menuEffectStop";
    public static const SHOW_HELP:String = "showHelp";

    public var data:*;

    public function MenuEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
        data=body;
    }
}
}