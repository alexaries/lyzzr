package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x34 扩展背包
 */
public class PackExtendCmd extends BaseCmd {
    /**
     * type = 0 扩展背包
     * type = 1 扩展魂魄背包
     */
    public var type:uint = 0

    public function PackExtendCmd() {
        this.msgType = MsgConst.PACK_EXTEND;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}