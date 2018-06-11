package net.data.recvMsg.task {
import net.data.BaseMsg;

import utils.ByteArray;

public class TaskHookAddMsg extends BaseMsg {
    public function TaskHookAddMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {


        return true;
    }
}
}