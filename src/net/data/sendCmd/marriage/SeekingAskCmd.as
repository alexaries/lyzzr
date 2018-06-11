package net.data.sendCmd.marriage {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class SeekingAskCmd extends BaseCmd {
    public var playerId:BigInteger;
    public var token:uint;

    public function SeekingAskCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(0x06);
            BytesUtil.writeUint64(bodyBytes, playerId);
            this.bodyBytes.writeByte(token);
        }
        catch (e:*) {

        }
        return;
    }
}
}