package net.data.recvMsg.group {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyRoomCaptainMsg extends BaseMsg {
    public var leaderId:BigInteger;

    public function GroupCopyRoomCaptainMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        var idBytes:ByteArray;
        idBytes = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        leaderId = BytesUtil.readUint64(idBytes);

        return true;
    }
}
}
