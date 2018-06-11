package net.data.sendCmd {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x00 keep alive
 */
public class KeepAliveCmd extends BaseCmd {
    /**
     * 标签
     */
    public var flag:uint = 0;

    public function KeepAliveCmd() {
        this.msgType = MsgConst.KEEP_ALIVE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(flag);
        }
        catch (e:Error) {

        }
    }
}

}