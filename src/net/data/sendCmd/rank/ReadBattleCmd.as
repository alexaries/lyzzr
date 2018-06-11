package net.data.sendCmd.rank {
import net.data.BaseCmd;
import net.events.MsgConst;

public class ReadBattleCmd extends BaseCmd {
    private var _formationID:int;

    public function ReadBattleCmd() {
        super();
        msgType = MsgConst.READ_BATTLE;
    }

    private var _flag:int;

    public function set flag(value:int):void {
        _flag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_flag);
            if (_flag == 1) {
                bodyBytes.writeShort(_formationID);
            }
        } catch (e:*) {
        }
    }

    public function set formationID(formationID:int):void {
        _formationID = formationID;
    }
}
}