package net.data.sendCmd {
import net.consts.StaticConfig;
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class CreateRoleCmd extends BaseCmd {
    private var _characterName:String = "";
    private var _characterType:int = 0;
    private var _countryId:int = 0;

    public function CreateRoleCmd() {
        this.msgType = MsgConst.CREATE_ROLE;
    }

    override protected function createBody():void {
        try {
//				bodyBytes.writeUTF(characterName);
            BytesUtil.writeUserName(characterName, bodyBytes);
            bodyBytes.writeByte(characterType);
            var level:int = StaticConfig.vipLv;
            var exlevel:int = StaticConfig.lv3366;
            var qpluslv:int = StaticConfig.qpluslv;
//            if (StaticConfig.platflag == 2) {
//                bodyBytes.writeByte(exlevel);
//                bodyBytes.writeByte(level);
//            } else if (StaticConfig.platform == "4") {
//                bodyBytes.writeByte(qpluslv);
//                bodyBytes.writeByte(level);
//            } else {
                bodyBytes.writeByte(level);
                bodyBytes.writeByte(exlevel);
//            }
            bodyBytes.writeByte(StaticConfig.isYearVip);
            bodyBytes.writeUTF(StaticConfig.platform);
            if (StaticConfig.hashid && StaticConfig.hashid != "")
                bodyBytes.writeUTF(StaticConfig.hashid);
            else
                bodyBytes.writeUTF(StaticConfig.openid);
            bodyBytes.writeUTF(StaticConfig.openkey);
            bodyBytes.writeUTF(StaticConfig.via);
            bodyBytes.writeUTF(StaticConfig.invited);
            bodyBytes.writeByte(StaticConfig.returnPlayerLv);
            bodyBytes.writeUTF(StaticConfig.clientip + ":" + StaticConfig.pf + ":" + StaticConfig.pfkey + ":" + StaticConfig.xy_type + ":" + StaticConfig.pubacctgold + ":" + (StaticConfig.isNew_qq));
        }
        catch (e:Error) {

        }
    }

    //------------------------------角色创建的getter setter------------------------
    public function get countryId():int {
        return _countryId;
    }

    public function set countryId(value:int):void {
        _countryId = value;
    }

    public function get characterType():int {
        return _characterType;
    }

    public function set characterType(value:int):void {
        _characterType = value;
    }

    public function get characterName():String {
        return _characterName;
    }

    public function set characterName(value:String):void {
        _characterName = value;
    }

}
}