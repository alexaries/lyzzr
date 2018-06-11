package net.data.recvMsg.xsgift {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class XsGiftMsg extends BaseMsg {
    public var type:uint = 0;
    public var state:uint = 0;
    public var n:uint = 0;

    public function XsGiftMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

            bytes.position = 0;
            type = BytesUtil.readByte1(bytes)
            if ([0x03, 0x06, 0x07, 0x0B].indexOf(type) > -1)
                state = BytesUtil.readByte1(bytes);
            else if (type == 0x0a) {
                n = BytesUtil.readByte1(bytes);
                state = bytes.readUnsignedShort();
            }

            return true;
        }


    }
}