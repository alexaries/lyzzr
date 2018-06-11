package net.data.sendCmd.marriage {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class SeekingAskReplyCmd extends BaseCmd {
    public var playerId:BigInteger;

    public function SeekingAskReplyCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(0x08);
            BytesUtil.writeUint64(bodyBytes, playerId);
        }
        catch (e:*) {

        }
        return;
    }
}
}