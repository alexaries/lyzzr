/**
 * Created by huangcb on 2017/8/17.
 */
package net.data.recvMsg.login {
import net.data.BaseMsg;

import utils.ByteArray;

public class NewCharacterMsg extends BaseMsg  {
    public var   flag:int;
    public function NewCharacterMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        flag= bytes.readInt();
        return true;
    }
}
}
