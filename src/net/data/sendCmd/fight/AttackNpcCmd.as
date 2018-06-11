package net.data.sendCmd.fight {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x61 攻击NPC
 */
public class AttackNpcCmd extends BaseCmd {
    /**
     * NPC ID
     */
    private var _npcId:uint = 0;

    public function AttackNpcCmd() {
        this.msgType = MsgConst.ATTACK_NPC;
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
        }
        catch (e:*) {

        }
    }
}
}