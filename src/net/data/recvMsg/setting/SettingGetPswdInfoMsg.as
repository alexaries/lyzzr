package net.data.recvMsg.setting {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xCB 密宝问题返回
 */
public class SettingGetPswdInfoMsg extends BaseMsg {
    public function SettingGetPswdInfoMsg() {
        super();
    }

    private var _question:String = "";
    private var _flag:uint = 0;

    public function get question():String {
        return _question;
    }

    public function get flag():uint {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _flag = BytesUtil.readByte1(bytes);
        if (_flag == 0) {
            _question = bytes.readUTF();
        }

        return true;
    }
}
}