/**
 * Created by huangcb on 2017/8/17.
 */
package net.mediator {
import net.data.recvMsg.KeepAliveMsg;
import net.data.sendCmd.KeepAliveCmd;
import net.events.MsgEvent;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class SocketConnectionMediator  extends Mediator implements IMediator{
    public static const NAME:String = "SocketConnectionMediator";
    var socketConnectionProxy:SocketConnectionProxy;
    public function SocketConnectionMediator(__viewComponent:Object=null) {
        super (NAME,__viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        socketConnectionProxy = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy ;
        Laya.timer.loop(30000,this,keepAliveStart);
    }

    override public function onRemove():void {
        super.onRemove();
        Laya.timer.clear(this,keepAliveStart);
    }

    override public function listNotificationInterests():Array {
        return [MsgEvent.KEEP_ALIVE];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch ( name )
        {
            case MsgEvent.KEEP_ALIVE:
                var msg:KeepAliveMsg = body as KeepAliveMsg;
                 socketConnectionProxy.serverTimeDelay = (Laya.timer.currTimer-socketConnectionProxy.startKeepAlive)/2;
                break;
        }
    }
    function keepAliveStart():void
    {
        var cmd:KeepAliveCmd = new KeepAliveCmd();
        var flag:uint =Laya.timer.currTimer;
        cmd.flag = flag;
        socketConnectionProxy.send(cmd);
    }
}
}
