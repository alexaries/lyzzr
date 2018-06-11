package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class FireHeroMsg extends BaseMsg {
    public function FireHeroMsg() {
        super();
    }

    private var _heroID:uint;
    private var _result:uint;

    public function get result():uint {
        return _result;
    }

    public function get heroID():uint {
        return _heroID;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _result = BytesUtil.readByte1(bytes);
            _heroID = bytes.readUnsignedInt();
        } catch (e:*) {

        }
        return true;
    }
}
}