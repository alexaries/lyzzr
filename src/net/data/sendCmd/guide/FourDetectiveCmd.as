package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class FourDetectiveCmd extends BaseCmd {
    public var type:uint;
    public var index:uint;
    public var info:uint;

    public function FourDetectiveCmd() {
        this.msgType = MsgConst.FOUR_DETECTIVE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(index);
            switch (type) {
                case 0:
                    this.bodyBytes.writeUnsignedInt(info);
                    break;
                case 1:
                    break;
            }
        } catch (e:*) {
        }
    }
}
}
