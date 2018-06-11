package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息协议  0x97
 * 请求自己宗门成员列表
 * @author RyanCao
 *
 */
public class ClanReqSelfListCmd extends BaseCmd {
    public function ClanReqSelfListCmd() {
        super();
        this.msgType = MsgConst.CLAN_PLAYER_LIST;
    }

    private var _flag:int;
    /**
     *    查询成员标志<br>
     *    0 - 查询的是宗门成员<br>
     *    1 - 查询的是申请宗门列表<br>
     * @param value
     *
     */
    public function set flag(value:int):void {
        _flag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_flag);
        } catch (e:*) {

        }
    }
}
}