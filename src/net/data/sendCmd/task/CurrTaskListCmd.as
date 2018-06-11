package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x82 玩家获取当前任务列表请求
 */
public class CurrTaskListCmd extends BaseCmd {
    public function CurrTaskListCmd() {
        this.msgType = MsgConst.CURR_TASK_LIST;
    }

    override protected function createBody():void {
        try {

        }
        catch (e:*) {

        }
    }
}
}