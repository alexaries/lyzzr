package net.data.recvMsg.daily {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author john
 */
public class ActivityCompassMsg extends BaseMsg {
    public var type:uint;
    public var left:uint;
    public var goodsId:uint;

    public function ActivityCompassMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0:
                    left = bytes.readUnsignedInt();
                    break;
                case 1:
                    goodsId = bytes.readUnsignedInt();
                    break;
                case 2:
                    left = bytes.readUnsignedInt();
                    goodsId = bytes.readUnsignedInt();
                    break;
            }
        } catch (err:Error) {
        }
        return true;
    }
}
}
