package net.data.recvMsg {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xE0 登录反馈
 */
public class LoginMsg extends BaseMsg {
    private var _flag:int = -1;
    private var _charname:String = "";
    private var _timeStep:uint = 0;

    public function LoginMsg() {
        super();
    }

    public function getFlag():int {
        return _flag;
    }


    public function getCharName():String {
        return _charname;
    }


    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _flag = bytes.readInt();

        if (_flag == 0) {
            //登录成功
            _charname = BytesUtil.readUserName(bytes);
        }
        else if (_flag == 3) {
            _timeStep = bytes.readUnsignedInt();
        }


        return true;
    }
}
}