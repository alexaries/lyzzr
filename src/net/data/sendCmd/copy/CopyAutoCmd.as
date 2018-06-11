package net.data.sendCmd.copy {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 *
 * 副本自动战斗
 * @author ryan
 */
public class CopyAutoCmd extends BaseCmd {
    private var _type:int;
    private var _copyID:int;
    private var _flag:int;

    public function CopyAutoCmd() {
        super();
        msgType = MsgConst.COPY_AUTO_DATA;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            bodyBytes.writeByte(_copyID);
            if (_type == 0)
                bodyBytes.writeByte(_flag);
        } catch (e:*) {
        }
    }

    public function set copyID(copyID:int):void {
        _copyID = copyID;
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set flag(flag:int):void {
        _flag = flag;
    }
}
}
