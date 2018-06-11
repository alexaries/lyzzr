/**
 * Created by dingcj on 2017/12/4.
 */
package net.data.sendCmd.sevenday {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SevendayInfoCmd extends BaseCmd {
    private var _type:uint = 0;
    private var _state:uint = 0;
    private var _eventId:uint = 0;

    public function SevendayInfoCmd() {
        this.msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(state)
            bodyBytes.writeByte(eventId);
        }
        catch (e:*) {

        }
    }

    public function set type(value:uint):void {
        _type = value;
    }

    public function get type():uint {
        return _type;
    }

    public function set state(value:uint):void {
        _state = value;
    }

    public function get state():uint {
        return _state;
    }

    public function set eventId(value:uint):void {
        _eventId = value;
    }

    public function get eventId():uint {
        return _eventId;
    }
}
}
