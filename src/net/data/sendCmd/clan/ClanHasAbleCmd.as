package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * <code>(C->S)</code> 消息协议 0x91
 * @author RyanCao
 *
 */
public class ClanHasAbleCmd extends BaseCmd {
    public function ClanHasAbleCmd() {
        super();
        this.msgType = MsgConst.CLAN_SELF;
    }

    override protected function createBody():void {
        try {

        } catch (e:*) {

        }
    }
}
}