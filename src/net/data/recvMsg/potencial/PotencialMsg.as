package net.data.recvMsg.potencial {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x2C 潜力洗炼
 *
 */
public class PotencialMsg extends BaseMsg {
    public function PotencialMsg() {
        super();
    }

    public var type:uint;
    private var _result:int;
    public function get result():uint {
        return _result;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            _result = BytesUtil.readByte1(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}