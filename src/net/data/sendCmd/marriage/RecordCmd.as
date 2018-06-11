package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class RecordCmd extends BaseCmd {
    public var type:uint;
    public var page:uint;

    public function RecordCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x05);
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeShort(page);
        }
        catch (e:*) {

        }
        return;
    }
}
}