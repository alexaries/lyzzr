package net.data.sendCmd.reward {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xCF  领取在线奖励
 */
public class RewardDrawCmd extends BaseCmd {
    /**
     * byte - type
     * 0 - 获取奖励
     * 1 - 获取详情
     */
    public var type:uint = 0;

    public function RewardDrawCmd() {
        this.msgType = MsgConst.REWARD;
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