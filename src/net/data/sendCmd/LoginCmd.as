package net.data.sendCmd {
import com.hurlant.util.Base64;
import com.talkingdata.TDManager;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xE0 登录请求
 */
public class LoginCmd extends BaseCmd {
    public var userId:Number = 0;
    public var langId:Number = 0;//表示 XY平台的登录时间
    public var credit:String = "";
    public var serverNo:String = "";
    public var platform:String = "";
    public var openid:String = "";
    public var openkey:String = "";

    public function LoginCmd() {
        this.msgType = MsgConst.LOGIN;
    }

    override protected function createBody():void {
        bodyBytes.writeUnsignedInt(userId);
        bodyBytes.writeUnsignedInt(userId / 0x100000000);
        var level:int = StaticConfig.vipLv;
        var exlevel:int = StaticConfig.lv3366;
        var qpluslv:int = StaticConfig.qpluslv;
//        if (StaticConfig.platflag == 2) {
//            bodyBytes.writeByte(exlevel);
//            bodyBytes.writeByte(level);
//        } else if (StaticConfig.platform == "4") {
//            bodyBytes.writeByte(qpluslv);
//            bodyBytes.writeByte(level);
//        } else {
            bodyBytes.writeByte(level);
            bodyBytes.writeByte(exlevel);
//        }
        bodyBytes.writeByte(StaticConfig.isYearVip);
        bodyBytes.writeUnsignedInt(langId);
        var byte:ByteArray = Base64.decodeToByteArray(credit);
        bodyBytes.writeBytes(byte);
        bodyBytes.writeUTF(serverNo);
        bodyBytes.writeUTF(platform);
        bodyBytes.writeUTF(openid);
        bodyBytes.writeUTF(openkey);
        bodyBytes.writeUTF(StaticConfig.via);
        bodyBytes.writeUTF(TDManager.getDeviceId(userId));
        bodyBytes.writeUTF(StaticConfig.clientip + ":" + StaticConfig.pf + ":" + StaticConfig.pfkey + ":" + StaticConfig.xy_type + ":" + StaticConfig.pubacctgold + ":" + (StaticConfig.isNew_qq));
        trace("LoginCmd====",bodyBytes);
    }
}
}