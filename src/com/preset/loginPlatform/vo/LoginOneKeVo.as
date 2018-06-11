/**
 * Created by dingcj on 2017/11/18.
 */
package com.preset.loginPlatform.vo {
public class LoginOneKeVo {
    public var status:int;//接口返回状态
    public var message:String;//错误信息
    public var username:String;//用户名
    public var password:String;//用户密码
    public var token:String;//登录令牌
    public var sign:String;//自动登录签名
    public var expires_at:String;//令牌过期时间
    public var t:int;//请求时间戳

    public static function createVo(json:Object):LoginOneKeVo {
        var vo:LoginOneKeVo = new LoginOneKeVo();
        vo.status = json["status_code"];
        vo.message = json["message"];
        var obj:Object = json["data"];
        vo.username = obj["username"];
        vo.password = obj["password"];
        vo.token = obj["token"];
        vo.sign = obj["sign"];
        vo.expires_at = obj["expires_at"];
        vo.t = obj["t"];
        return vo;
    }
}
}
