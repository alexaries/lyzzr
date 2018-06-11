package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.data.structs.task.TaskStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x87 玩家新接任务信息
 */
public class NewTaskMsg extends BaseMsg {
    private var _newTask:TaskStruct;

    public function NewTaskMsg() {
        super();
    }

    public function get newTask():TaskStruct {
        return _newTask;
    }

    public function set newTask(value:TaskStruct):void {
        _newTask = value;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        newTask = new TaskStruct();
        newTask.flowId = bytes.readUnsignedInt();
        newTask.taskType = BytesUtil.readByte1(bytes);
        newTask.taskId = bytes.readUnsignedInt();
        newTask.acceptTime = bytes.readUnsignedInt();
        newTask.validStartTime = bytes.readUnsignedInt();
        newTask.validEndTime = bytes.readUnsignedInt();

        return true;
    }
}
}