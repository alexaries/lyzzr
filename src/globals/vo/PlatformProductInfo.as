/**
 * Created by guanll on 2017/11/7.
 */
package globals.vo {
public class PlatformProductInfo {
/**啪啪的接口
    product_id:"",
    product_name:"",
    app_order_id:"1234546787",
    pay_amount:"1.00",
    role_name:"用户名",
    app_name:"游戏名称_1",
    app_extra1:"",
    app_extra2:"",
    app_district:"",
    app_server:"",
    sign:"cdsfd70790709dfgjdfig0937r0wedsfoiuw" //签名 生成规则和支付回调及二次验证接口一致
*/
    public var app_key:String = "";
    public var app_order_id:Number = 0;//订单号
    public var app_district:String = "";//区
    public var app_server:String = "";//服
    public var app_user_id:String = "";
    public var app_user_name:String = "";//角色名称

    public var product_id:Number = 0;//商品id
    public var product_name:String = "";//商品名称
    public var money_amount:Number = 1;//价格 元
    public var app_name:String = "蜀山传奇H5";
    public var app_extra1:String = "";//扩展字段1 游戏内玩家id StaticCoonfig.userId10
    public var app_extra2:String = "";//扩展字段2
    public var sign:String = "";//啪啪平台要的签名 规则同二次验证

/**XY的接口
    gid:游戏id ，蜀山传奇游戏id为  7
    uid：登录后用户id，由登录传给游戏的用户id
    appusername：用户名
    sid：大区id
    openuid：用户游戏内id
    productid：用户购买道具id
    money：金额(单位元)
    resource：写死1016161
    app_order_id：订单id
 */
    public var gid:int = 7;//XY那边的 我们的游戏id
    public var pa_open_uid:Number = 0;//平台uid
    public var resource:int = 1016161;

    public var qudao:int = 1;

    /**
     * 橙子的接口
     appId:936, //应用ID
     serverId:input.app_server,//服务器ID
     serverName:input.app_district, //服务器名称 没有名称 暂时使用区号
     gameRoleId:xxx, //角色ID 填入游戏内部的int64位的uid
     gameRoleLevel:xxx, //角色等级
     gameRoleName:xxx, //角色名称
     mcode:xxx, //计费点 也就是商品id
     seesionId:xxx, //平台返回的唯一标示 填入平台的uid
     gameOrderCid:xxx, //游戏订单编号
     created_at:xxx, //请求unix时间戳 拿订单号的时候后台返回
     notifyUrl：xxx, //异步回调地址
     Sign:xxx //签名串，规则见下方 拿订单号的时候后台返回
     */
    public var roleLevel:int;
    public var notifyUrl:String = "http://111.231.105.35/new/shushan/yxorangeCallback.php";
    public var unixTime:uint = 0;

    /**
     * QQ空间 需要充值的数额
     */
    public var qzone_charge_num:int = 0;
    public function PlatformProductInfo() {
    }
}
}
