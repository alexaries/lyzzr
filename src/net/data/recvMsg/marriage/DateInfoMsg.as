package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;

public class DateInfoMsg extends BaseMsg {
    public var info:uint;

    public function DateInfoMsg() {
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
