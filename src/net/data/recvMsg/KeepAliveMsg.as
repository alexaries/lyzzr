package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * (S->C) 0x00 keep alive
 */
public class KeepAliveMsg extends BaseMsg {
    /**
     * 标签
     */
    public var flag:uint = 0;

    public function KeepAliveMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        this.flag = bytes.readUnsignedInt();

        return true;
    }
}
}