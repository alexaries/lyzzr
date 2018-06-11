package net.events {
public class SocketNotification {
    public static const CONNECTION:String = "connectionNotification";
    public static const NAME:String="Socket";

    public static const STARTUP_CONNECT:String                      = NAME + 'StartConnect';
    public static const MSG:String                      = NAME + 'Msg';
    public function SocketNotification() {
    }
}
}
