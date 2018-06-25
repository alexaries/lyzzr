/**
 * Created by dingcj on 2018/6/25.
 */
package net.mediator {
import com.game.common.mvc.BaseMediator;

import net.events.MsgEvent;
import net.proxy.HttpConnectionProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class HttpConnectionMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "HttpConnectionMediator";
    private var httpConnectionProxy:HttpConnectionProxy;

    public function HttpConnectionMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        httpConnectionProxy = facade.retrieveProxy(HttpConnectionProxy.NAME) as HttpConnectionProxy;
        Laya.timer.loop(30000, this, keepAliveStart);
    }

    override public function onRemove():void {
        super.onRemove();
        Laya.timer.clear(this, keepAliveStart);
    }

    function keepAliveStart():void {
        return;
//        var cmd:KeepAliveCmd = new KeepAliveCmd();
//        var flag:uint = Laya.timer.currTimer;
//        cmd.flag = flag;
//        httpConnectionProxy.send("", cmd);
    }

    override public function listNotificationInterests():Array {
        return [
            MsgEvent.KEEP_ALIVE
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case MsgEvent.KEEP_ALIVE:
                httpConnectionProxy.serverTimeDelay = (Laya.timer.currTimer - httpConnectionProxy.startKeepAlive) / 2;
                break;
        }
    }
}
}