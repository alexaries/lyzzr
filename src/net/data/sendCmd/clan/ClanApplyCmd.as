package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息协议 0x93 申请加入宗族
 *
 * @author RyanCao
 *
 */
public class ClanApplyCmd extends BaseCmd {
    public function ClanApplyCmd() {
        super();
        this.msgType = MsgConst.CLAN_APPLY;
    }

    private var _clanID:uint;

    /**
     * <br>
     *  设置宗族ID<br>
     * @param value  要加入的宗族ID
     *
     */
    public function set clanID(value:uint):void {
        _clanID = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(_clanID);
        } catch (e:*) {

        }
    }
}
}