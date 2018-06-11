package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;

public class StatusInfoMsg extends BaseMsg {
    public var type1:uint;
    public var type2:uint;
    public var cancel:uint;

    public function StatusInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type1 = bytes.readByte();
            type2 = bytes.readByte();
            cancel = bytes.readByte();
        } catch (e:*) {

        }
        return true;
    }
}
}