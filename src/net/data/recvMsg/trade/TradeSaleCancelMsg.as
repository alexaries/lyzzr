package net.data.recvMsg.trade {

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class TradeSaleCancelMsg extends BaseMsg {
    public var state:uint = 0;
    public var success:uint = 0;

    public function TradeSaleCancelMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        state = BytesUtil.readByte1(bytes);
        success = BytesUtil.readByte1(bytes);

        return true;
    }
}
}
