package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x09
 * @author ryan
 */
public class CarnivalCmd extends BaseCmd {
    /**
     * 代币使用类型
     */
    public var type:int;

    public function CarnivalCmd() {
        super();
        msgType = MsgConst.CARNIVAL;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}
