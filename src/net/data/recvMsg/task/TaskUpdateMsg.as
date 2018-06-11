package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x86 更新任务进度信息
 */
public class TaskUpdateMsg extends BaseMsg {
    /**
     * 任务流水号
     */
    public var flowId:uint = 0;
    /**
     * 需要更新的任务项(0：表示任务进度，1：表示任务是否已完成)
     */
    public var taskItem:uint = 0;
    /**
     * 需要更新的具体任务值， 任务进度、任务是否已完成。
     */
    public var taskValue:uint = 0;
    /**
     * 更新任务进度使用，表示任务步骤类型
     */
    public var taskStepType:uint = 0;

    public function TaskUpdateMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        flowId = bytes.readUnsignedInt();
        taskItem = BytesUtil.readByte1(bytes);
        taskValue = bytes.readUnsignedInt();
        taskStepType = bytes.readUnsignedInt();

        return true;
    }
}
}