package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class RefreshCmd extends BaseCmd {
    public function RefreshCmd() {
        this.msgType = MsgConst.ARENA_REFRESH;
    }

    public var type:int = 0;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
