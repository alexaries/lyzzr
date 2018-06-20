package com.preset.mediator {
import com.game.command.GameStartupCommand;
import com.preset.events.DataEvent;
import com.preset.login.vo.Server;
import com.preset.view.GameView;
import com.talkingdata.TDManager;

import globals.PlatformSDK;
import globals.PreLoadRes;
import globals.vo.PlatformRoleInfo;

import laya.utils.Handler;

import net.consts.StaticConfig;
import net.mediator.SocketConnectionMediator;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

import utils.PlatformUtil;

public class GameMediator extends Mediator implements IMediator {
    public static const NAME:String = "GameMediator";

    private function get gameView():GameView {
        return viewComponent as GameView;
    }

    public function GameMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);

    }

    override public function onRegister():void {
        super.onRegister();
        login();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            DataEvent.CREATE_ROLE,
            DataEvent.ILLEGAL_LOGIN,
            DataEvent.LOGIN_SUCCESS
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case DataEvent.CREATE_ROLE:
                keepLiveSocketConnectionMediator();
                createRole();
                break;
            case DataEvent.ILLEGAL_LOGIN:
                illegalLogin();
                break;
            case DataEvent.LOGIN_SUCCESS:
                keepLiveSocketConnectionMediator();
                loginSuccess();
                break;
        }
    }

    private function login():void {
        gameView.createRoleDispose();
        gameView.login();
    }

    function keepLiveSocketConnectionMediator() {
        facade.registerMediator(new SocketConnectionMediator(getViewComponent()));
    }

    private function loginSuccess():void {
        StaticConfig.loginSuccess = true;
        trace("login success!!!");
        trace("Server==" + JSON.stringify(Server.currServerVo) + "==UserName==" + StaticConfig.createRoleName + "==ROLE_type==" + StaticConfig.createRoleType + "==UserId==" + StaticConfig.userId);
        if (StaticConfig.createRoleName != "" && Server.currServerVo) {
            //刚刚发送过创角的协议
            var roleInfo:PlatformRoleInfo = new PlatformRoleInfo();
            roleInfo.roleId = StaticConfig.platform + "-" + StaticConfig.createRoleType + "-" + StaticConfig.userId;
            roleInfo.role_name = StaticConfig.createRoleName;
            roleInfo.role_type = StaticConfig.createRoleType;
            roleInfo.server = Server.currServerVo.serverId;
            roleInfo.server_name = Server.currServerVo.serverName;
            roleInfo.uid = StaticConfig.userId;
            roleInfo.app_district = Server.currServerVo.serverNumber;

            var platformRole:Object = PlatformUtil.createRoleInfo(roleInfo);
            if (platformRole) {
                PlatformSDK.getInstance().createRole(platformRole);//告诉平台 新创建了角色
            }
        }

        //登录成功统计
        TDManager.trackingLoginIn();

        gameView.loginDispose();
        gameView.createRoleDispose();

        PreLoadRes.getInstance().endHandler = Handler.create(this, game_startup);
        PreLoadRes.getInstance().load();
    }

    public function game_startup():void {
        facade.registerCommand(ApplicationFacade.GAME_STARTUP, GameStartupCommand);

        sendNotification(ApplicationFacade.GAME_STARTUP);
        gameView.createGameMain();
        //
    }

    private function illegalLogin():void {
        trace("illegallogin!!!");
    }

    private function createRole():void {
        trace("createrole");
        gameView.loginDispose();
        gameView.createRole();

    }
}
}
