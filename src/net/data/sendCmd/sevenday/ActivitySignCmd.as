/**
 * Created by dingcj on 2018/1/2.
 */
package net.data.sendCmd.sevenday {
import net.data.BaseCmd;
import net.events.MsgConst;

public class ActivitySignCmd extends BaseCmd {

    private var _type:uint = 0;
    private var _day:uint = 0;

    public function ActivitySignCmd() {
        super();
        this.msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(day);
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

    public function set day(value:uint):void {
        _day = value;
    }

    public function get day():uint {
        return _day;
    }
}
}
