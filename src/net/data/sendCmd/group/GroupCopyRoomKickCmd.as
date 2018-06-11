package net.data.sendCmd.group {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author
 */
public class GroupCopyRoomKickCmd extends BaseCmd {
    public var userId:BigInteger = BigInteger.nbv(0);

    public function GroupCopyRoomKickCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x12);
            BytesUtil.writeUint64(bodyBytes, userId);
        }
        catch (e:*) {
        }
    }
}
}
