/**
 * Created by dingcj on 2017/12/18.
 */
package net.data.sendCmd.tavern {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TavernHireCmd extends BaseCmd {
    private var _type:int;

    public function TavernHireCmd() {
        this.msgType = MsgConst.HIRE_HERO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }

    public function set type(value:int):void {
        this._type = value;
    }

    public function get type():int {
        return _type;
    }
}
}
