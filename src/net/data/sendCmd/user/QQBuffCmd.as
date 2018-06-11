package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class QQBuffCmd extends BaseCmd {
    public var type:uint;

    public function QQBuffCmd() {
        super();
        msgType = MsgConst.QQ_BUFF;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        } catch (e:*) {
        }
    }
}
}
