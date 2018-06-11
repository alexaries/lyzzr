package net.data.sendCmd.copy {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class FormationAutoCmd extends BaseCmd {
    public function FormationAutoCmd() {
        super();
        msgType = MsgConst.FORMATION_AUTO_DATA;
    }

    private var _type:int;
    private var _fID:int;
    private var _flag:int;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            bodyBytes.writeByte(_fID);
            if (_type == 0)
                bodyBytes.writeByte(_flag);
        } catch (e:*) {
        }
    }

    public function set formationID(fID:int):void {
        _fID = fID;
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set flag(flag:int):void {
        _flag = flag;
    }
}
}
