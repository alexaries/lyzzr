package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 消息协议  0x92
 * @author RyanCao
 *
 */
public class ClanCreateCmd extends BaseCmd {
    public function ClanCreateCmd() {
        super();
        this.msgType = MsgConst.CLAN_CREATE;
    }

    private var _clanName:String;
    private var _purpose:String;
    private var _qq:String;

    public function set qq(value:String):void {
        _qq = value;
    }


    public function set purpose(value:String):void {
        _purpose = value;
    }


    public function set clanName(value:String):void {
        _clanName = value;
    }

    override protected function createBody():void {
        try {
//				bodyBytes.writeUTF(_clanName);
            BytesUtil.writeUserName(_clanName, bodyBytes);
            bodyBytes.writeUTF(_qq);
            bodyBytes.writeUTF(_purpose);
        } catch (e:*) {

        }
    }
}
}