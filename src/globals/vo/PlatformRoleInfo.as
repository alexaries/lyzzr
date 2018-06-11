/**
 * Created by guanll on 2017/11/7.
 */
package globals.vo {
public class PlatformRoleInfo {
    public var server_name:String;
    public var server:String;//服id
    public var role_name:String;//角色名称
    public var role_type:int;//角色类型
    public var app_district:String;//区id
    public var uid:Number;//平台用户id
    public var roleId:String;//游戏那边的id 渠道号-uid
    public function PlatformRoleInfo() {
    }
}
}
