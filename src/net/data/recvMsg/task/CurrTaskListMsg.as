package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.data.structs.task.TaskStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x82 玩家获取当前任务列表反馈
 */
public class CurrTaskListMsg extends BaseMsg {
    private var taskList:Array;

    public function CurrTaskListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        taskList = [];
        var msgNums:uint = BytesUtil.readByte2(bytes);
        for (var i:uint = 0; i < msgNums; i++) {
            var taskStruct:TaskStruct = new TaskStruct();
            taskStruct.flowId = bytes.readUnsignedInt();
            taskStruct.taskType = BytesUtil.readByte1(bytes);
            taskStruct.taskId = bytes.readUnsignedInt();
            taskStruct.acceptTime = bytes.readUnsignedInt();

            var taskStepNum:uint = BytesUtil.readByte2(bytes);
            for (var j:uint = 0; j < taskStepNum; j++) {
                taskStruct.stepList.push(BytesUtil.readByte2(bytes));
            }

            taskStruct.validStartTime = bytes.readUnsignedInt();
            taskStruct.validEndTime = bytes.readUnsignedInt();
            taskStruct.isCompleted = BytesUtil.readByte1(bytes);
            taskStruct.isSubmit = BytesUtil.readByte1(bytes);
            taskList.push(taskStruct);
        }

        return true;
    }

    public function getCurrTaskListVO():Array {
        return taskList;
    }
}
}