/**
 * Created by guanll on 2017/9/19.
 */
package com.preset.loading.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class LoadingEvent extends Notification implements INotification {
    public static const LOADING_START:String = "loading_start";
    public static const LOADING_END:String = "loading_end";
    public static const LOADING_PROGRESS:String = "loading_progress";
    public static const SHOW_LOADING_VIEW:String = "show_loading_view";
    public static const LOADING_REMOVE:String = "LOADING_REMOVE";
    public function LoadingEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}
