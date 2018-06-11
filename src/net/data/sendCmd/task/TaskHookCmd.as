package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TaskHookCmd extends BaseCmd {
    private var _npcId:uint;
    public var state:uint = 0;

    public function TaskHookCmd() {
        this.msgType = MsgConst.TASK_HOOK;
    }

    public function get npcId():uint {
        return _npcId;
    }

    public function set npcId(value:uint):void {
        _npcId = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(npcId);
            this.bodyBytes.writeByte(state);
        }
        catch (e:*) {

        }
    }
}
}