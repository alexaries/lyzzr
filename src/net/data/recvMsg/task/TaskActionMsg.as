package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x85 玩家接受、提交、放弃某任务请求
 * 0:表示任务接受 1:表示任务提交 2:表示任务放弃
 */
public class TaskActionMsg extends BaseMsg {
    public var taskId:uint = 0;
    public var action:uint = 0;

    public function TaskActionMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        taskId = bytes.readUnsignedInt();
        action = BytesUtil.readByte1(bytes);

        return true;
    }
}
}