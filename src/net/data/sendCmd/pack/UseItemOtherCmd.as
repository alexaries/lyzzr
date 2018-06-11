package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class UseItemOtherCmd extends BaseCmd {
    public function UseItemOtherCmd() {
        super();
        msgType = MsgConst.USE_PACK_NEW;
    }

    public var itemNums:Array = [];

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(itemNums[0]);
            this.bodyBytes.writeByte(itemNums[1]);
            this.bodyBytes.writeShort(itemNums[2]);
            this.bodyBytes.writeUTF(itemNums[3]);
        }
        catch (e:*) {

        }
    }
}
}
