package net.data.sendCmd.babel {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 自动通天塔
 */
public class BabelAutoFightCmd extends BaseCmd {
    public var copyID:int;
    public var flag:int = 0;
    public var mode:int = 0;

    public function BabelAutoFightCmd() {
        super();
        msgType = MsgConst.BABEL_AUTO_START;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(copyID);
            this.bodyBytes.writeByte(flag);
            this.bodyBytes.writeByte(mode);
        } catch (e:*) {
        }
    }
}
}