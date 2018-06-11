package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;

public class GemBatchUpgradeCmd extends BaseCmd {
    public function GemBatchUpgradeCmd() {
        msgType = MsgConst.GEM_UPGRADE;
    }

    public var gemId:uint = 0;
    public var normalNums:uint = 0;
    public var bindingNums:uint = 0;
    public var protect:uint = 0;
    public var fgtId:uint = 0;

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(gemId);
            bodyBytes.writeShort(normalNums);
            bodyBytes.writeShort(bindingNums);
            bodyBytes.writeByte(protect);
            bodyBytes.writeUnsignedInt(fgtId);
        } catch (e:*) {

        }
    }
}
}