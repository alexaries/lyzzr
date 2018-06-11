/**
 * Created by huangcb on 2017/8/17.
 */
package net.command {
import com.game.common.view.Alert;
import com.game.events.NotiEvent;

import lang.SystemInfo;

import laya.ui.Dialog;

import laya.utils.Handler;

import net.events.ConnectionNotification;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class ConnectionCommand extends SimpleCommand implements ICommand
{
    private var socketConnectionProxy:SocketConnectionProxy= facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy ;
    private var count:int = 0;//重连次数
    override public function execute(notification:INotification):void
    {
        var type:String=notification.getType();
        if(type==ConnectionNotification.CONNECTTED){
            return;
        }
        if(type==ConnectionNotification.IO_ERROR){
            return;
        }
        if(type==ConnectionNotification.CONNECTION_ERROR&&socketConnectionProxy.isReConnect){
            Alert.show("连接已断，是否重新连接？","连接断开",[SystemInfo.OK,SystemInfo.CANCEL],Handler.create(this,reconnectHandler));
            return;
        }
        if(!type && !socketConnectionProxy.kickOff &&socketConnectionProxy.isReConnect){
            //如果不是被别人踢掉的 就允许玩家选择是否重连
            Alert.show("连接已断，是否重新连接？","连接断开",[SystemInfo.OK,SystemInfo.CANCEL],Handler.create(this,reconnectHandler));
            return;
        }
    }

    private function reconnectHandler(type:String):void {
        if(type == Dialog.OK){
            count++;
            if(count >= 10){
                facade.notifyObservers(new NotiEvent(NotiEvent.ROLL_ALERT, "已经重连次数过多！建议检查网络并重新打开游戏！"));
                return;
            }

            socketConnectionProxy.reconnect();
        }
    }
}
}
