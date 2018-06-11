package net.data.sendCmd.potential {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x37 闭关洗炼
 */
public class RetreatCmd extends BaseCmd {
    public function RetreatCmd() {
        this.msgType = MsgConst.RETREAT;
    }

    public var type:uint = 0;
    public var heroId:uint = 0;
    public var subType:uint = 0;
    public var time:uint = 0;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0:
                    break;
                case 1:
                case 2:
                    bodyBytes.writeUnsignedInt(heroId);
                    bodyBytes.writeByte(subType);
                    bodyBytes.writeUnsignedInt(time);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}