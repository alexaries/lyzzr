package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.data.structs.task.AvailableTask;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x83 玩家获取当前可接任务列表反馈
 */
public class CurrAvailableTaskMsg extends BaseMsg {
    private var taskList:Array;

    public function CurrAvailableTaskMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        var msgNums:int = BytesUtil.readByte2(bytes);
        taskList = [];
        for (var i:uint = 0; i < msgNums; i++) {
            var availableTask:AvailableTask = new AvailableTask();
            availableTask.taskId = bytes.readUnsignedInt();
            taskList.push(availableTask);
        }

        return true;
    }

    public function getAvalibleTaskVO():Array {
        return taskList;
    }
}
}