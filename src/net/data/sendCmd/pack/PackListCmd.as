package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x30 查询包裹
 */
public class PackListCmd extends BaseCmd {
    public function PackListCmd() {
        this.msgType = MsgConst.PACK_INFO;
    }

    override protected function createBody():void {
        try {

        }
        catch (e:*) {

        }
    }
}
}