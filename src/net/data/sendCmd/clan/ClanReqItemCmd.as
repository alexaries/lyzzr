package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息协议 0x96
 * 请求请求某个宗族的信息
 * @author RyanCao
 *
 */
public class ClanReqItemCmd extends BaseCmd {
    public function ClanReqItemCmd() {
        super();
        this.msgType = MsgConst.CLAN_REQ_OTHER;
    }

    private var _calnID:uint;

    public function set calnID(value:uint):void {
        _calnID = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(_calnID);
        } catch (e:*) {

        }
    }
}
}