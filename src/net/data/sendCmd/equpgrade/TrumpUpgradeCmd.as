package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author user
 */
public class TrumpUpgradeCmd extends BaseCmd {
    public function TrumpUpgradeCmd() {
        super();
        msgType = MsgConst.TRUMP_UPGRADE;
    }

    public var fighterId:uint;

    public var trumpId:Number;

    public var type:uint;

    /**
     * 0-未绑定 1-绑定
     * @param value
     *
     */


    override protected function createBody():void {
        try {
            bodyBytes.writeShort(fighterId);
            BytesUtil.writeBigInt(trumpId, bodyBytes);
            bodyBytes.writeByte(type);
        } catch (e:*) {

        }
    }
}
}
