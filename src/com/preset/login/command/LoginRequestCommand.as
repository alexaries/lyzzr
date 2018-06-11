/**
 * Created by huangcb on 2017/8/17.
 */
package com.preset.login.command {
import com.preset.events.DataEvent;

import net.consts.StaticConfig;
import net.data.recvMsg.LoginMsg;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class LoginRequestCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        trace("LoginRequestCommand");
        var socketConnectionProxy:SocketConnectionProxy = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        var msg:LoginMsg = notification.getBody() as LoginMsg;
        switch (msg.getFlag()) {
            case 0:


                //登录 成功
                StaticConfig.userName = msg.getCharName();

                this.sendNotification(DataEvent.LOGIN_SUCCESS);

                socketConnectionProxy.isReConnect = true;

                break;
            case 1:
                //登录失败，请创建新角色
                //发送一个， 消息
                this.sendNotification(DataEvent.CREATE_ROLE);
                break;
            case 2:
                //登录失败 这是一个非法入境者
                this.sendNotification(DataEvent.ILLEGAL_LOGIN);
                break;

        }
    }
}
}
