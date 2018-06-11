package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;

//public static const EXC_PLAYER:int = 0;//历练的对手
/**
 * 请求斗剑场列表
 */
public class ArenaInfoCmd extends BaseCmd {
    public var type:uint = 0;

    public function ArenaInfoCmd() {
        this.msgType = MsgConst.ARENA_INFO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(type);
        }
        catch (e:*) {

        }
    }
}
}
