package net.data.sendCmd.sWar {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class SWarCmd extends BaseCmd {
    public var type:int;
    public var flag:int;
    public var startID:int;
    public var count:int;

    public function SWarCmd() {
        super();
        msgType = MsgConst.SWAR_INFO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(flag);
            bodyBytes.writeShort(startID);
            bodyBytes.writeByte(count);
        } catch (e:Error) {
        }
    }
}
}
