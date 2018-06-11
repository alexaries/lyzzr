package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author user
 */

public class EqUnsealCmd extends BaseCmd {
    public function EqUnsealCmd() {
        super();
        msgType = MsgConst.EQ_UNSEAL;
    }

    public var fighterId:uint;

    public var eqId:Number;

    /**
     * 0-未绑定 1-绑定
     * @param value
     *
     */


    override protected function createBody():void {
        try {
            bodyBytes.writeShort(fighterId);
            BytesUtil.writeBigInt(eqId, bodyBytes);
        } catch (e:*) {

        }
    }
}
}
