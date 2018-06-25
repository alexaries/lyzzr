package com.game.module.user.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.common.view.Alert;
import com.game.vo.UserData;

import lang.SystemInfo;

import net.proxy.HttpConnectionProxy;

public class UserProxy extends BaseProxy {
    public static const NAME:String = "UserProxy";
    var connection:HttpConnectionProxy;
    public var userData:UserData;

    public function UserProxy() {
        super(NAME);
        userData = new UserData();
        connection = facade.retrieveProxy(HttpConnectionProxy.NAME) as HttpConnectionProxy;
    }

    public function beDisconnected():void {
        connection.kickOff = true;
        Alert.show(SystemInfo.BE_DISCONNECTED, "", [SystemInfo.OK]);
    }
}
}
