package net.data.recvMsg.active {

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 七日活动返回
 * @author ryan
 */
public class SevenBackActivityMsg extends BaseMsg {
    public var type:uint;
    public var cts1:uint;
    public var cts2:uint;
    public var cts3:uint;
    public var will:uint;
    public var income:uint;
    public var dot:uint;
    public var online:uint;
    public var cts:uint;
    public var day:uint;
    public var cts4:uint;

    public function SevenBackActivityMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        if (type == 0) {
            income = bytes.readUnsignedInt();
            dot = BytesUtil.readByte1(bytes);
            online = 0;
            cts1 = BytesUtil.readByte1(bytes);
            cts2 = BytesUtil.readByte1(bytes);
            cts = BytesUtil.readByte1(bytes);
            cts3 = BytesUtil.readByte1(bytes);
            will = BytesUtil.readByte1(bytes);
            day = BytesUtil.readByte1(bytes);
            cts4 = BytesUtil.readByte1(bytes);
        } else if (type == 4) {
            will = BytesUtil.readByte1(bytes);
        } else if (type == 5) {
            income = bytes.readUnsignedInt();
        } else if (type == 6) {
            dot = BytesUtil.readByte1(bytes);
        }

        return true;
    }
}
}
