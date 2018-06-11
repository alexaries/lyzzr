package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x85 玩家接受、提交、放弃某任务请求
 * 0:表示任务接受 1:表示任务提交 2:表示任务放弃
 */
public class TaskActionCmd extends BaseCmd {
    /**
     * 此任务编号
     */
    private var _taskId:uint = 0;
    /**
     * 0:表示任务接受 1:表示任务提交 2:表示任务放弃
     */
    private var _action:uint = 0;
    /**
     * 奖励物品ID, 这里是选择的物品ID，对于固定的物品奖励，不用传了
     */
    private var _itemId:uint = 0;
    /**
     * 奖励物品的数量
     */
    private var _awardNums:uint = 0;

    public function TaskActionCmd() {
        this.msgType = MsgConst.TASK_ACTION;
    }

    public function get awardNums():uint {
        return _awardNums;
    }

    public function set awardNums(value:uint):void {
        _awardNums = value;
    }

    public function get itemId():uint {
        return _itemId;
    }

    public function set itemId(value:uint):void {
        _itemId = value;
    }

    public function get action():uint {
        return _action;
    }

    public function set action(value:uint):void {
        _action = value;
    }

    public function get taskId():uint {
        return _taskId;
    }

    public function set taskId(value:uint):void {
        _taskId = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(taskId);
            bodyBytes.writeByte(action);
            bodyBytes.writeUnsignedInt(itemId);
            bodyBytes.writeShort(awardNums);
        }
        catch (e:*) {

        }
    }
}
}