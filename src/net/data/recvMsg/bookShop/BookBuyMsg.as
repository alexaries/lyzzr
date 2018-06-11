package net.data.recvMsg.bookShop {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class BookBuyMsg extends BaseMsg {
    public var result:uint;
    public var id:uint;

    public function BookBuyMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        result = BytesUtil.readByte1(bytes);
        id = BytesUtil.readByte1(bytes);

        return true;
    }
}
}