package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x81 玩家点击交互动作请求
 */
public class NpcInteractCmd extends BaseCmd {
    /**
     *
     */
    private var _npcId:uint = 0;
    /**
     *
     */
    private var _interactType:uint = 0;
    /**
     *
     */
    private var _interactId:uint = 0;
    /**
     *
     */
    private var _interactStep:uint = 0;

    public function NpcInteractCmd() {
        this.msgType = MsgConst.NPC_INTERACT;
    }

    public function get interactStep():uint {
        return _interactStep;
    }

    public function set interactStep(value:uint):void {
        _interactStep = value;
    }

    public function get interactId():uint {
        return _interactId;
    }

    public function set interactId(value:uint):void {
        _interactId = value;
    }

    public function get interactType():uint {
        return _interactType;
    }

    public function set interactType(value:uint):void {
        _interactType = value;
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
            bodyBytes.writeByte(interactType);
            bodyBytes.writeUnsignedInt(interactId);
            bodyBytes.writeByte(interactStep);
        }
        catch (e:Error) {

        }
    }
}
}