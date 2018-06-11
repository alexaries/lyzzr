/**
 * Created by guanll on 2017/11/8.
 */
package net.data.recvMsg {
import net.data.BaseMsg;

import utils.ByteArray;

/**
 * (S->C) 0x10 重连反馈
 */
public class ReConnectionMsg extends BaseMsg{
    private var _flag:int = -1;

    public function ReConnectionMsg() {
        super();
    }

    public function getFlag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _flag = bytes.readByte();//0 重连成功
        trace("重连==flag=="+_flag);
        return true;
    }
}
}
