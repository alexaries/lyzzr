package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * 任务消息处理
 */
public class TaskListMsg extends BaseMsg {
    public function TaskListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        return true;
    }
}
}