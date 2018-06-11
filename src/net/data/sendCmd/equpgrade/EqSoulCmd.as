package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author user
 */
public class EqSoulCmd extends BaseCmd {
    public function EqSoulCmd() {
        super();
        msgType = MsgConst.EQ_SOUL;
    }

    public var fighterId:uint;

    public var eqId:Number;
    public var opt:uint;

    /**
     * 0-未绑定 1-绑定
     * @param value
     *
     */


    override protected function createBody():void {
        try {
            bodyBytes.writeByte(opt);
            bodyBytes.writeShort(fighterId);
            BytesUtil.writeBigInt(eqId, bodyBytes);
        } catch (e:*) {

        }
    }
}
}
