package net.data.sendCmd.copy {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class FormationDataCmd extends BaseCmd {
    private var _type:int;
    private var _copyID:int;
    private var _debryID:int;

    public function FormationDataCmd() {
        super();
        msgType = MsgConst.FORMATION_DATA;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            bodyBytes.writeByte(_copyID);
            if (_type == 4 || _type == 0) {
                bodyBytes.writeByte(_debryID);
            }
        } catch (e:*) {
        }
    }

    public function set formationID(copyID:int):void {
        _copyID = copyID;
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set debryID(debryID:int):void {
        _debryID = debryID;
    }
}
}
