package net.data.recvMsg.pub {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class HotelPubHireMsg extends BaseMsg {
    public var result:uint;
    public var id:uint;//位置

    public function HotelPubHireMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
            id = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}