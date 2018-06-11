package net.events {
import org.puremvc.as3.patterns.observer.Notification;

public class ConnectionNotification extends  Notification {
    /**
     * 连接成功
     */
    public static const CONNECTTED:String = "connectSucess";
    /**
     * 连接错误
     */
    public static const CONNECTION_ERROR:String = "connectError";
    /**
     * IO错误
     */
    public static const IO_ERROR:String = "ioError";
    public function ConnectionNotification(name:String, body:Object=null ,type:String=null) {
        super(name, body , type);
    }

}
}