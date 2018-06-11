package net.data.sendCmd.group {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author
 */
public class GroupCopyRoomCaptainCmd extends BaseCmd {
    public var leaderId:BigInteger = BigInteger.nbv(0);

    public function GroupCopyRoomCaptainCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x11);
            BytesUtil.writeUint64(bodyBytes, leaderId);
        }
        catch (e:*) {

        }
    }
}
}
