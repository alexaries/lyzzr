package net.data.sendCmd.fight {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x6C 请求战斗报告
 */
public class FightStartCmd extends BaseCmd {
    /**
     * 战报ID
     */
    private var _battleId:uint = 0;

    public function FightStartCmd() {
        this.msgType = MsgConst.FIGHT_REPORT;
    }

    public function get battleId():uint {
        return _battleId;
    }

    public function set battleId(value:uint):void {
        _battleId = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(battleId);
        }
        catch (e:*) {

        }
    }
}
}