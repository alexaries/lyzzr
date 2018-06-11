package net.data.sendCmd.arena {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 斗剑场发起挑战
 */
public class LaunchFightCmd extends BaseCmd {
    /**1:斗剑场发起挑战,2:历练挑战*/
    public var type:uint = 0;
    public var userName:String = "";
    public var rivalDifficulty:int = 0;

    public function LaunchFightCmd() {
        this.msgType = MsgConst.ARENA_FIGHT_INFO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            BytesUtil.writeUserName(userName, bodyBytes);
            if (type == 1) {
                bodyBytes.writeByte(rivalDifficulty);
            }
        }
        catch (e:*) {

        }
    }
}
}
