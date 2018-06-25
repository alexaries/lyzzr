/**
 * Created by dingcj on 2018/6/25.
 */
package net.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class HttpNotification extends Notification implements INotification {
    public static const CONNECTION:String = "connectionNotification";
    private static const NAME:String = "Http";
    public static const STARTUP_CONNNECT:String = NAME + "StartConnect";
    public static const MSG:String = NAME + "Msg";

    public function HttpNotification(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }

}
}