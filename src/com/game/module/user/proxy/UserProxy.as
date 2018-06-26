package com.game.module.user.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.common.view.Alert;
import com.game.vo.UserData;

import lang.SystemInfo;

public class UserProxy extends BaseProxy {
    public static const NAME:String = "UserProxy";
    public var userData:UserData;

    public function UserProxy() {
        super(NAME);
        userData = new UserData();
    }

    public function beDisconnected():void {
        connection.kickOff = true;
        Alert.show(SystemInfo.BE_DISCONNECTED, "", [SystemInfo.OK]);
    }
}
}
