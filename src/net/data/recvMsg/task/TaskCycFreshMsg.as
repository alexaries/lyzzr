package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/*
 * 0x8b (s->c)师门任务
 */
public class TaskCycFreshMsg extends BaseMsg {
    public var cyc:uint;
    public var refreshCount:uint;
    public var finishCount:uint;
    public var leftCount:uint;
    public var tasks:Array;//Task

    // public var loopTaskId:uint;
    // public var taskColor:uint;
    // public var time:uint;
    public function TaskCycFreshMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        cyc = BytesUtil.readByte1(bytes);
        refreshCount = BytesUtil.readByte2(bytes);
        finishCount = BytesUtil.readByte1(bytes);
        leftCount = BytesUtil.readByte1(bytes);
        tasks = [];
        for (var i:uint = 0; i < 6; i++) {
            var task:TaskCycFreshVOMsg = new TaskCycFreshVOMsg();
            task.id = bytes.readUnsignedInt();
            task.color = BytesUtil.readByte1(bytes);
            tasks.push(task);
        }
        // loopTaskId = bytes.readUnsignedInt();
        // taskColor = BytesUtil.readByte1(bytes);
        // time = bytes.readUnsignedInt();

        return true;
    }
}
}
