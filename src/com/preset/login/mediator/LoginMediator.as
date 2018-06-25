package com.preset.login.mediator {
import com.preset.events.DataEvent;
import com.preset.login.events.LoginEvent;
import com.preset.login.view.LoginView;
import com.preset.login.vo.Server;
import com.preset.login.vo.ServerRequest;
import com.talkingdata.TDManager;

import globals.PlatformSDK;

import laya.utils.Handler;

import net.consts.StaticConfig;
import net.events.HttpNotification;
import net.proxy.HttpConnectionProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;
import org.puremvc.as3.patterns.observer.Notification;

/**
 * ...
 * @author
 */
public class LoginMediator extends Mediator implements IMediator {
    public static const NAME:String = "LoginMediator";

    private var view:LoginView;

    private var connection:HttpConnectionProxy;


    public function LoginMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        connection = facade.retrieveProxy(HttpConnectionProxy.NAME) as HttpConnectionProxy;

        view = getViewComponent() as LoginView;
        view.loginClick.getSignal(this).listen(OnClickLoginBtn);

        if (PlatformSDK.getInstance().checkIsTest() == false) {
            ServerRequest.getInstance().onComplete.completes(Handler.create(this, onServerComplete));
        }
    }

    private function onServerComplete(data:*):void {
        view.onServerComplete(data);
    }

    private function OnClickLoginBtn(ip, port):void {
        sendNotification(DataEvent.LOGIN_SUCCESS);
        return;

        //发送协议
        requestLogin(ip, port);
        if (PlatformSDK.getInstance().checkIsTest()) {
            return;
        }
        //初始化TD
        TDManager.initTDAccount(StaticConfig.userId + "", 1, Server.currServerVo.serverName);
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case DataEvent.LOGIN_SUCCESS:
                //登录成功
                //sendNotification( DataNotification.LOGIN_SUCCESS);
                break;
            case DataEvent.ILLEGAL_LOGIN:
                //登录非法

                break;
            case LoginEvent.CLOSE_SERVER:
                view.clearServer();
                break;
            case LoginEvent.UPDATE_SELECT:
                view.updateSelectServer();
                break;
        }
    }

    override public function listNotificationInterests():Array {
        return [
            //  DataEvent.LOGIN_SUCCESS,
            DataEvent.ILLEGAL_LOGIN,
            LoginEvent.CLOSE_SERVER,
            LoginEvent.UPDATE_SELECT
        ];
    }

    //发送协议开始请求登录
    public function requestLogin(_ip:String, _port:Number):void {
        trace("@requestLogin==", _ip, _port);
        facade.notifyObservers(new Notification(HttpNotification.STARTUP_CONNNECT, {ip: _ip, port: _port}));
    }
}

}