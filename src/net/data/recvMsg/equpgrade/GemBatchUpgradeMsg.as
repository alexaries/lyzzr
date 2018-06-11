package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class GemBatchUpgradeMsg extends BaseMsg {
    /**
     * 批量合成协议<br>
     * 协议号 0x4B
     *
     */
    public function GemBatchUpgradeMsg() {
        super();
    }

    private var _result:uint = 0;
    private var _gemId:uint = 0;
    private var _normalNum:uint = 0;
    private var _bindingNum:uint = 0;
    private var _success:uint = 0;
    private var _failed:uint = 0;
    private var _heroId:uint = 0;

    public function get result():uint {
        return _result;
    }

    public function get gemId():uint {
        return _gemId;
    }

    public function get normalNum():uint {
        return _normalNum;
    }

    public function get bindingNum():uint {
        return _bindingNum;
    }

    public function get success():uint {
        return _success;
    }

    public function get failed():uint {
        return _failed;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _result = BytesUtil.readByte1(bytes);
            _gemId = BytesUtil.readByte2(bytes);
            _normalNum = BytesUtil.readByte2(bytes);
            _bindingNum = BytesUtil.readByte2(bytes);
            _success = BytesUtil.readByte2(bytes);
            _failed = BytesUtil.readByte2(bytes);
            _heroId = BytesUtil.readByte4(bytes);
        } catch (e:*) {

        }
        return true;
    }

    public function get heroId():uint {
        return _heroId;
    }
}
}