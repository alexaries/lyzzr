package net.data.sendCmd.babel {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 结束通天塔
 */
public class BabelEndFightCmd extends BaseCmd {
    public function BabelEndFightCmd() {
        super();
        msgType = MsgConst.BABEL_END;
    }

    override protected function createBody():void {
    }
}
}