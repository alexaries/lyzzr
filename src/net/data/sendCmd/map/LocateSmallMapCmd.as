package net.data.sendCmd.map {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息id:0x51
 * 据点ID
 */
public class LocateSmallMapCmd extends BaseCmd {
    private var _locID:int = -1;

    public function LocateSmallMapCmd() {
        this.msgType = MsgConst.MAP_LOCATE;
    }

    public function get locID():int {
        return _locID;
    }

    public function set locID(value:int):void {
        _locID = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeShort(locID);
        }
        catch (e:*) {

        }
    }
}
}