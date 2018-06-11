package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CDepotRecordCmd extends BaseCmd {
    public var startID:int = 0;
    public var count:int = 0;
    public var type:int

    public function CDepotRecordCmd() {
        super();
        super.msgType = MsgConst.CLAN_DEPOT_RECORD;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeShort(startID);
            bodyBytes.writeByte(count);
        } catch (e:*) {
        }
    }
}
}
