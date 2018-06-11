package net.data.recvMsg.trade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class TradeReCoCaDeMsg extends BaseMsg {
    private var _id:uint;
    private var _status:uint;

    public function TradeReCoCaDeMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _id = bytes.readUnsignedInt();
        _status = BytesUtil.readByte1(bytes);

        return true;
    }

    public function get id():uint {
        return _id;
    }

    public function get status():uint {
        return _status;
    }
}
}