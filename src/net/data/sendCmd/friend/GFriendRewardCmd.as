package net.data.sendCmd.friend {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class GFriendRewardCmd extends BaseCmd {
    public var type:int;
    public var idx:int;

    public function GFriendRewardCmd() {
        super();
        msgType = MsgConst.GFRIEND_REWARD;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(idx);
        } catch (e:*) {

        }
    }
}
}
