package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class N525Msg extends BaseMsg {
    public var times:uint;
    public var rank:uint;
    public var nData:Array;

    public function N525Msg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        times = bytes.readUnsignedInt();
        rank = bytes.readUnsignedInt();
        nData = [];
        var len:int = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < len; i++) {
            nData.push([i + 1, BytesUtil.readUserName(bytes), BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes), bytes.readUnsignedInt()]);
        }

        return true;
    }
}
}
