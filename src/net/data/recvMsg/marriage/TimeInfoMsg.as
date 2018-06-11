package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;

public class TimeInfoMsg extends BaseMsg {
    public var info:uint;

    public function TimeInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            info = bytes.readUnsignedInt();
        } catch (e:*) {

        }
        return true;
    }
}
}