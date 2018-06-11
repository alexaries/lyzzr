/**
 * Created by dingcj on 2017/11/1.
 */
package com.preset.login.vo {
public class ServerHistroyLoginVo {
    public var serverId:String; //服务器id
    public var roleName:String;//角色名
    public var roleLevel:String;//角色等级
    public var roleJob:int;//角色职业
    public var roleSex:int;//角色性别
    public var time:int;//登录时间

    public static function Create(o:Object):ServerHistroyLoginVo {
        var vo:ServerHistroyLoginVo = new ServerHistroyLoginVo();
        var json:Object = o;
        vo.serverId = json["server_id"];
        vo.roleName = json["role_name"];
        vo.roleLevel = json["role_level"];
        vo.roleJob = parseInt(json["role_profession"]);
        vo.roleSex = parseInt(json["role_sex"]);
        vo.time = parseInt(json["login_time"]);
        return vo;
    }
}
}
