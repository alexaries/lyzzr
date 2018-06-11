package net.data.sendCmd.achievement {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 * 0x0C
 */
public class AchievementCmd extends BaseCmd {
    /**获取类型 0-获取成就信息 1-获取成就奖励*/
    public var type:uint = 0;
    /**成就Id*/
    public var achievId:uint = 0;

    public function AchievementCmd() {
        this.msgType = MsgConst.ARCHIEVEMENT;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 1)
                bodyBytes.writeShort(achievId);
        }
        catch (e:*) {

        }
    }
}
}
