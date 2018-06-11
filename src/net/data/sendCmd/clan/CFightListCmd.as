package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CFightListCmd extends BaseCmd {

    public var startID:int;
    public var count:int;

    public function CFightListCmd() {
        super();
        super.msgType = MsgConst.CLAN_FIGHT_LIST;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(startID);
            bodyBytes.writeByte(count);
        } catch (e:*) {

        }
    }
}
}
