/**
 * Created by dingcj on 2017/11/18.
 */
package com.preset.loginPlatform.vo {
public class LoginSDK {
    public static var oneKeyVo:LoginOneKeVo;
    public static var registerInVo:LoginRegisterInVo;
    public static var loginLoginVo:LoginLoginVo;

    public static function parseOneKey(json:Object):void {
        oneKeyVo = LoginOneKeVo.createVo(json);
    }

    public static function parseRegisterIn(json:Object):void {
        registerInVo = LoginRegisterInVo.createVo(json);
    }

    public static function parseLogin(json:Object):void {
        loginLoginVo = LoginLoginVo.createVo(json);
    }
}
}
