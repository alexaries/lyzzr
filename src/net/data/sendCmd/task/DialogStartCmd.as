package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x80 玩家点击NPC触发
 */
public class DialogStartCmd extends BaseCmd {
    private var _npcId:uint = 0;

    public function DialogStartCmd() {
        this.msgType = MsgConst.DIALOG_START;
    }

    public function get npcId():uint {
        return _npcId;
    }

    public function set npcId(value:uint):void {
        _npcId = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(npcId);
        }
        catch (e:Error) {

        }
    }
}
}