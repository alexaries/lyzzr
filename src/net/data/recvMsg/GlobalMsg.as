package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 0x09 全局事件
 * */
public class GlobalMsg extends BaseMsg {
    public var type:uint;
    public var args:uint;

    public function GlobalMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        args = bytes.readUnsignedInt();

        return true;
    }

}
}