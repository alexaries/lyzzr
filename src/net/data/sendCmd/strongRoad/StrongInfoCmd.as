package net.data.sendCmd.strongRoad {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class StrongInfoCmd extends BaseCmd {
    public var type:uint = 0;
    public var id:uint = 0;
    //public var index:uint = 0;

    public function StrongInfoCmd() {
        this.msgType = MsgConst.STRONG_INFO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 3) {
                bodyBytes.writeByte(id);
                //bodyBytes.writeByte(index);
            }
        }
        catch (e:*) {

        }
    }
}
}
