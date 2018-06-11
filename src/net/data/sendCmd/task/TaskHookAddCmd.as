package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TaskHookAddCmd extends BaseCmd {
    public function TaskHookAddCmd() {
        this.msgType = MsgConst.TASK_HOOK_ADD;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}