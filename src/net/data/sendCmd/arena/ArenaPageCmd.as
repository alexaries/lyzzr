package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class ArenaPageCmd extends BaseCmd {
    public var type:int;
    public var athlDiffculty:int;
    public var athlCategory:int;

    public function ArenaPageCmd() {
        this.msgType = MsgConst.ARENA_PAGE;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 1) {
                bodyBytes.writeByte(athlDiffculty);
                bodyBytes.writeByte(athlCategory);
            }
        }
        catch (e:*) {

        }
    }
}
}
