package net.data.recvMsg.setting {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xCD <br>
 * 密宝设置密码返回<br>
 * byte    op    操作类型<br>
 * byte    res    操作返回 0-成功，1-失败<br>
 */
public class SettingOperatePswdMsg extends BaseMsg {
    public function SettingOperatePswdMsg() {
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