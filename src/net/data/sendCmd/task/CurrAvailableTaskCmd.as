package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x83 玩家获取当前可接任务列表请求
 */
public class CurrAvailableTaskCmd extends BaseCmd {
    public function CurrAvailableTaskCmd() {
        this.msgType = MsgConst.CURR_AVAILABLE_TASK;
    }

    override protected function createBody():void {
        try {

        }
        catch (e:*) {

        }
    }
}
}