package net.data.sendCmd.fight {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x6C 请求战斗报告
 */
public class FightReportTypeCmd extends BaseCmd {
    /**
     * 战报ID
     */
    public var reportId:uint = 0;
    public var type:uint;

    public function FightReportTypeCmd() {
        this.msgType = MsgConst.FIGHT_REPORT_TYPE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(reportId);
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}