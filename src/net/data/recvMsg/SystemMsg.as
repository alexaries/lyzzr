package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x0F 消息提示
 */
public class SystemMsg extends BaseMsg {
    /**
     * 消息类型
     */
    public var type:uint = 0;
    /**
     * 消息代号
     */
    public var code:uint = 0;

    public function SystemMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        code = bytes.readUnsignedInt();

        return true;
    }
}
}