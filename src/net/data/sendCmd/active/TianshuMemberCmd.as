package net.data.sendCmd.active {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class TianshuMemberCmd extends BaseCmd {
    public var flag:uint;
    public var type:uint;
    public var pid:BigInteger;

    public function TianshuMemberCmd() {
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(0x20);
        bodyBytes.writeByte(flag);
        bodyBytes.writeByte(type);
        BytesUtil.writeUint64(bodyBytes, pid);
    }
}
}