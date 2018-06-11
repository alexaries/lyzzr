package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TianshuCmd extends BaseCmd {
    public var flag:uint;
    public var type:uint;

    public function TianshuCmd() {
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(0x20);
        bodyBytes.writeByte(flag);
        bodyBytes.writeByte(type);
    }

}
}