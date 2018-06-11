package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

public class GuoqingCmd extends BaseCmd {
    public var type:uint;

    public function GuoqingCmd() {
        super();
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(0x20);
        bodyBytes.writeByte(0x02);
        bodyBytes.writeByte(type);
    }
}
}