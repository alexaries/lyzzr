package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PracticeStartCmd extends BaseCmd {
    /**0:加入修炼列表,1:移出修炼列表*/
    public var type:uint = 0;
    public var fighterId:uint = 0;

    public function PracticeStartCmd() {
        this.msgType = MsgConst.PRACTICE_START;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeUnsignedInt(fighterId);
        }
        catch (e:*) {

        }
    }
}
}
