package net.data.structs.chat {
public class ChatStruct {
    public static const WORLD:uint = 0;	//世界频道
    public static const COUNTRY:uint = 1;	//阵营频道
    public static const CLAN:uint = 2;	//宗族频道
    public static const LOUD_SPEAKER:uint = 3;	//大喇叭
    public static const MAP:uint = 4; //地图
    public static const GROUP:uint = 5;	//组队
    public static const BATTLE_REPORT:uint = 6; //战报
    public static const FLAUNT:uint = 7;	//炫耀                     TYPE_VIPFLAUNT
    public static const LOUD_SPEAKER_2:uint = 8;	//大喇叭2
    public static const LOUD_SPEAKER_3:uint = 9;	//大喇叭3
    public static const MARRY_FIREWORKS:uint = 11; //结婚烟花
    public static const WHISPER:uint = 0xFF; //私聊
    public static const CITYWAR:int = 13;//城战

//		public static const TYPE_TIANYUAN              :uint = 16; //天元

    public static const TYPE_COMMON:String = "a";	//普通聊天
    public static const TYPE_FLAUNT:String = "b";	//炫耀
    public static const TYPE_VIPFLAUNT:String = "c";//充值vip炫耀
    public static const TYPE_FINDTA:String = "d";//充值vip炫耀
    public static const TYPE_MAXI:String = "e";//杀怪炫耀
    public static const TYPE_BFGIFT:String = "f";//百服大礼包炫耀
    public static const TYPE_FIELDBOSS:String = "g";//野外boss
    public static const TYPE_RED:String = "h";//红包
    public static const TYPE_DECLARE:String = "j";//宣战组队



    public static const CHANEL_FLAG_SYSTEM:int = 1
    public static const CHANEL_FLAG_WORLD:int = 2;
    public static const CHANEL_FLAG_COUNTRY:int = 3;
    public static const CHANEL_FLAG_CLANE:int = 4
    public static const CHANEL_FLAG_CITY:int = 5;

    public static const REFRESH_WENU_WIN_CONFIG:String = "GM:::refreshConfig";

    /**频道类型*/
    public var type:uint;
    /**玩家名称*/
    public var _name:String;
    public function get name():String {
        return _name;
    }

    public function set name(name:String):void {
        var nbStr:String = String.fromCharCode(8238);
        var reg:RegExp = new RegExp(nbStr, "g");
        if (name)
            _name = name.replace(reg, "");
        else
            _name = "";
    }

    /**阵营,0:峨嵋,1:昆仑*/
    public var countryId:uint = 0;
    /**
     * 发送者的等级
     */
    public var level:uint = 50;
    /***/
    public var reciveCountryId:uint = 0;
    /**性别,0:男,1:女*/
    public var gender:int = -1;
    /**守护*/
    public var officeId:uint = 0;
    /**平台编号,0x01:蓝钻,0x02,黄钻*/
    public var platform:uint = 0;
    /**消息体*/
    public var bodymsg:String;
    //代表此vo是服务端生成还是本地生成,用来区分显示自己的私聊内容
    public var isLocal:Boolean = false;
    /*是否夫妻称号 0无称号 1有称号  男的家有娇妻  女的名花有主 2新称号*/
    public var isCoupleId:uint = 0;

    /**
     * vip等级，用于表示vip图标 0xff表示隐藏
     */
    public var vipLevel:uint = 0;

    /**是否隐藏称号*/
    public var isHideTitle:uint = 0;


    public function ChatStruct() {
    }

    //------------ function ------------//
    public function getGenderString():String {
        if (this.gender == 0)
            return "男";
        return "女";
    }

    public function get channelName():String {
        return "";
    }

    public function get channelColor():String {
        var obj:Object = new Object();
        obj[WORLD] = "#ffffff";
        obj[LOUD_SPEAKER] = "#FF9900";
        obj[COUNTRY] = "#00fe06";
        obj[CLAN] = "#00fe06";
        obj[LOUD_SPEAKER_2] = "#ffffff";
        obj[LOUD_SPEAKER_3] = "#ffffff";
        obj[WHISPER] = "#92ca51";
        obj[CITYWAR] = "#ffffff";
        return obj[type];
    }

    public function getPositionString():String {

        return "你真是个人才";
    }


}
}
