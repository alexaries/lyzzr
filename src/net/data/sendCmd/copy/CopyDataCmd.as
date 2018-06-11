package net.data.sendCmd.copy {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CopyDataCmd extends BaseCmd {
    private var _type:int;
    private var _copyID:int;

    public function CopyDataCmd() {
        super();
        msgType = MsgConst.COPY_DATA;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            bodyBytes.writeByte(_copyID);
        } catch (e:*) {
        }
    }

    public function set copyID(copyID:int):void {
        _copyID = copyID;
    }

    public function set type(type:int):void {
        _type = type;
    }
}
}
