package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S)0x15 个人信息改变
 */
public class StateCmd extends BaseCmd {
    public function StateCmd() {
        this.msgType = MsgConst.STATE;
    }

    private var _field:int;
    private var _data:uint;

    public function set data(value:uint):void {
        _data = value;
    }

    public function set field(value:int):void {
        _field = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_field);
            bodyBytes.writeUnsignedInt(_data);
        }
        catch (e:*) {

        }

    }
}
}