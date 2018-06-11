package net.data.recvMsg.gold {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GoldGetMsg extends BaseMsg {
    public var result:uint = 0;

    public function GoldGetMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}
