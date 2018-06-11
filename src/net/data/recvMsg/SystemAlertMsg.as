package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * @author ryan
 */
public class SystemAlertMsg extends BaseMsg {

    public function SystemAlertMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        return true;
    }
}
}
