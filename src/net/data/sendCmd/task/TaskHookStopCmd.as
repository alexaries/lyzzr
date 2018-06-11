package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TaskHookStopCmd extends BaseCmd {
    public function TaskHookStopCmd() {
        this.msgType = MsgConst.TASK_HOOK_STOP;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}