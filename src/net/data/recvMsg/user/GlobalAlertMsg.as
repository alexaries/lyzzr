package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x0F 消息提示
 */
public class GlobalAlertMsg extends BaseMsg {
    public var type:uint = 0;
    public var msgCode:uint = 0;
    public var msgData:uint = 0;

    public function GlobalAlertMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            this.type = BytesUtil.readByte1(bytes);
            this.msgCode = bytes.readUnsignedInt();
            this.msgData = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
        return true;
    }
}
}