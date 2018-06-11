/**
 * Created by dingcj on 2017/12/15.
 */
package net.data.sendCmd.hooker {
import net.data.BaseCmd;
import net.events.MsgConst;

public class HookerCmd extends BaseCmd {
    private var _type:uint = 0;
    private var _pos:uint = 0;
    private var _fighterId:uint = 0;

    public function HookerCmd() {
        this.msgType = MsgConst.TASK_HOOK;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 2) {
                bodyBytes.writeByte(pos);
                bodyBytes.writeInt(fighterId);
            }
        }
        catch (e:*) {
        }
    }

    public function get type():uint {
        return _type;
    }

    public function set type(value:uint):void {
        _type = value;
    }

    public function get pos():uint {
        return _pos;
    }

    public function set pos(value:uint):void {
        _pos = value;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }
}
}
