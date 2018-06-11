package net.data.sendCmd.pub {
import net.data.BaseCmd;
import net.events.MsgConst;

public class HotelPubHireCmd extends BaseCmd {
    private var _pos:uint = 0;

    public function HotelPubHireCmd() {
        this.msgType = MsgConst.HIRE_HERO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(pos);
        }
        catch (e:*) {

        }
    }

    public function get pos():uint {
        return _pos;
    }

    public function set pos(value:uint):void {
        _pos = value;
    }
}
}