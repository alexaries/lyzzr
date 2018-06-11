package net.consts {
import com.hurlant.math.BigInteger;

import globals.ServiceTime;

import laya.media.SoundChannel;

public class StaticConfig {
    public static var PROTOCOL:String = "http://";
    public static const TianYuanVo_isNewServerConfig:Boolean = false;
    public static const EQ_START_FLOW_ID:uint = 30000;
    /**平台的登录时间*/
    public static var langId:Number = 0;
    public static var userId:Number = 0;
    public static var createRoleName:String = "";//创建角色时取的名字
    public static var createRoleType:int = 0;//创建角色时选择的职业
    public static var gad:Array = [];
    public static var server:String = "192.168.100.25";
    public static var serverId:String = "1";
    public static var cfgServer:String = "undefined";
//    public static var currIpFlag:uint = 0;
    public static var channel:String = "undefined";
    public static var wallow:String = "0";
//    public static var port:int = 0;
    public static var credit:String = "H/xxU78lIwZbG/G5dvbXS/3y6G6c6J9LWkrYDyL0XcMH+5Rw";
    //是否合服的标志
    public static var isMerge:int = 0;
    //是否使用本地配置
//    public static var isLocalCfg:int = 0;

    public static var appid:int = 27036;//腾讯平台上的应用id
//    public static var seqid:int = 0;


    public static var userName:String;
    public static var countryId:int = 0;//角色最少的国家 0:峨嵋,1昆仑
//    public static const HOTEL_AUTOREFRESH_MAX:int = 9999;
//    public static var hotelAutoRefreshPrice:int = 20;
    /**背包初始容量*/
//    public static var packCapacity:int = 100;
    /**背包叠加上限*/
//    public static const packPileLimit:int = 99;
    public static var httpServer:String = "ui/";
    static public var fightAvatarsUrl:String = "fight/avatars/";
    static public var soundUrl:String = "sound/";
    public static var musicOnOff:Boolean = true;
//    public static var resServer:String = "";
//    public static var qqdomainServer:String = "http://app27036.imgcache.qzoneapp.com/app27036/assets_zh_CN/";
//    public static var cdnroot:String = "";
//
//    public static var cityWarListTimer:int = 60;//攻城列表请求时间间隔(秒)
//    public static var volume:int = 1;	//音量
    public static var isReconnect:Boolean = false;//是否正在重连中
    /**
     * 与服务端通信的数据包延时毫秒数
     */
//    public static var serverTimeDelay:int = 0;
//    public static var isDebug:Boolean = false;
    public static var loginSuccess:Boolean = false;

    public static var isNew:Boolean = false;
    /**
     * 繁体ggzz 统计
     * */
    public static var isNew_web:Boolean = false;
    /**
     * 简体统计
     * */
    public static var isNew_qq:Boolean = false;

    /**一键xx  等级限制*/
    public static var oneKeyLv:int = 250;
    /**一键xx  等级限制*/
    public static var oneKeyMinLv:int = 1;

//    public static var isVip:int = 0;
    public static var vipLv:int = 0;
    public static var lv3366:int = 0;
    public static var qpluslv:int = 0;
    public static var isYearVip:int = 0;
    /**
     * 平台特权标志<br>
     * 0 - 黄<br>
     * 1 - 蓝<br>
     * 2 - 3366<br>
     * 3 - 官网<br>
     * 4 - FaceBook<br>
     * 5 - TW.XY.COM<br>
     * 6 - Q+<br>
     * 7 - Viet<br>
     * 1000 - other<br>
     */
    public static var platflag:uint = 0;
    /**
     * 控制位
     */
    public static var checkBit:int = 0xff;

//    public static var gVersion:String = "";
//    public static var mainVersion:String = "";//资源版本
//    public static var platforms:Array = [
//        ["0", "xxxxxx"],
//        ["1", "wufan"],
//        ["2", "xy"]
//    ];
    public static var platform:String = "1";
    public static var curVersion:String = "";
//    /**
//     * QQ联盟服
//     * */
//    public static var qqUnions:Array = [
//        ["1", "10029"]	//iwan 爱玩
//    ];
//    public static var qqUnionPf:String = "";

    /**
     * 腾讯支付参数
     */
    public static var pf:String = "";
    public static var pfkey:String = "";
    public static var openkey:String = "";
    public static var via:String = "";//客户端 ios andriod pc
//    /**
//     * 幸運星標誌
//     * */
//    public static var fvia:String = "";
    public static var openid:String = "";

    public static var xy_type:uint = 0;
//    public static var xy_level:uint = 0;

//    public static var startConnTime:Number;
    public static var gid:String = "2";
    public static var invited:String = "";
//    public static var reConnect:Boolean = false;
//    public static var nickName:String = "";
//    public static var ufrom:String = "";
//    public static var ucost:uint = 0;
//    /**
//     * 0 - 不需要绑定<br>
//     * 1 - 需要绑定<br>
//     */
//    public static var needBing:uint = 0;
//    public static var sName:String = "";
//    public static var configUrl:String = "config.xml";
//    public static var sysCfgUrl:String = "sysAnnoc.xml";
    //public static var sysupCfgUrl:String = "sysup.xml";
    /**
     * 新用户是否为他服回流用户 标志 页面传入<br>
     * default : 0<br>
     * 0 - false <br>
     * 1 - true<br>
     */
    public static var reflux:int = 0;
    public static var spread:uint = 0;
//    public static var sien_us:String = "";
    public static var spread2:int;

    /**
     * 回流用户等级 0为非回流用户
     */
    public static var returnPlayerLv:uint = 0;
    /**
     * 回流服务器 0为非回流服务器
     */
    public static var isReturnServer:uint = 0;

    /**
     * 皮肤版本
     */
    public static var skinVersion:uint = 0;

    /**
     * 黄钻 空间朋友 显示 折扣劵 tips
     * */
    public static var pubacctgold:uint = 0;
    public static var pubacctsilver:uint = 0;
    public static var pubacctcuprum:uint = 0;
//    /**
//     * QQ交叉游戏
//     * */
//    public static var qqjxArr:Array = [];
//    /**
//     * 是否为豪华蓝钻
//     * */
//    public static var is_super_blue_vip:uint;
//    public static var is_super_yellow_vip:uint;
//    /**
//     * FB Money
//     * */
//    public static var fbMoneys:Array = [10, 50, 100, 200, 500, 1000];
//    /**
//     * FB TOUSE Money
//     * */
//    public static var fbUseMoneys:Array = ["USD 10", "USD 50", "USD 100", "USD 200", "USD 500", "USD 1000"];
    public static var clientip:String = "";
//    public static var subchannel:String = "";
    public static var paychannel:String = "";
    public static var hashid:String = "";
//    public static var fviaEnable:int = 0;
//    /*
//     * qq空间内是否有礼物接受
//     **/
//    public static var acceptRequestOpenId:String = "";
//    /**
//     * 系统弹框是否弹出
//     * */
//    public static var sysWin_lock:uint = 0;
//    /**
//     * 是否可以领取
//     */
//    public static var qqbrowser:uint = 0;
//    /**
//     * 星光
//     */
//    public static var shining:uint = 0;
//    /**
//     * 开通快捷支付
//     */
//    public static var openQQtenPay:uint = 0;
//    /**
//     * 欲流失标志 0无 1濒临沉默用户  2沉默用户
//     */
//    public static var app_appbitmap:uint;
//    /**
//     * 邀请人的openid
//     */
//    public static var app_recall:String = "";
//
//    public static var promotion:String;
//    public static var promotion_sign:String;
//    /**舞台宽*/
//    public static var STAGE_WIDTH:int;
//    /**舞台高*/
//    public static var STAGE_HEIGHT:int;
//
//    public static var sscqDownloadSpeed:String = "";
//    public static var musicVolume:Number;
    public static var musicName:String = "bg1.mp3";
    public static var musicTime:Number = 0;
    public static var soundFightUrl:String;
    public static var playSoundUrl:String;
    public static var welcome:Boolean=false;

    public static function get nowTime():uint {
        return ServiceTime.getInstance().getServiceTime()
    }

    public static function get nowDate():Date {
        return ServiceTime.getInstance().nowDate;
    }

    public function StaticConfig() {
    }

    /**
     * 需要压进聊天信息包的字串
     */
    public static function get userId16():String {
        return bigUserId.toString(16);
    }

    private static var _bigUserId:BigInteger;
    public static var userId10:String;
//    /**
//     * 需要向服务端发送玩家自己的id信息和所在服信息
//     */


    /**
     * 是否是繁体
     * @return
     *
     */
    public static function get isTW():Boolean {
        return StaticConfig.platflag > 3 && StaticConfig.platflag < 6;
    }


//    public static function get isQQPlatform():Boolean {
//        return StaticConfig.platflag == 0 || StaticConfig.platflag == 3 || StaticConfig.platflag == 6;
//    }
//
//    public static function get isQQZone():Boolean {
//        return StaticConfig.platform == "1";
//    }
//
//    /**
//     * 是否是空间测试区
//     * @return
//     *
//     */
//    public static function get isDebugServer():Boolean {
//        return platform == "1" && parseInt(cfgServer.replace("s", "")) == 34
//    }

    static function getBigUserId():BigInteger {
        var userIdBig:BigInteger = BigInteger.nbv(userId );
        userIdBig = userIdBig.add(BigInteger.nbv(parseInt(platform)).shiftLeft(40));//平台id
       if (isMerge != 0)
            userIdBig = userIdBig.add(BigInteger.nbv(parseInt(serverId)).shiftLeft(48));
        trace(userId.toString(), userIdBig.toString());
        return userIdBig;
   }
    public static function get bigUserId():BigInteger {
        if(_bigUserId==null){
            return getBigUserId();
        }
        return _bigUserId;
    }

    public static function set bigUserId(value:BigInteger):void {
        _bigUserId = value;
    }
}
}