package net.data.recvMsg.setting {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xCC<br>
 * 密宝锁定与解锁返回<br>
 *
 */
public class SettingUnlockMsg extends BaseMsg {
    public function SettingUnlockMsg() {
        super();
    }

    private var _result:uint = 0;
    private var _flag:uint = 0;

    public function get result():uint {
        return _result;
    }

    public function get flag():uint {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _flag = BytesUtil.readByte1(bytes);
        _result = BytesUtil.readByte1(bytes);

        return true;
    }
}
}