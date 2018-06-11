package net.data.sendCmd.map {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息id: 0x52
 * 位置传送
 */
public class TransportMapCmd extends BaseCmd {
    public function TransportMapCmd() {
        this.msgType = MsgConst.MAP_TRANSPORT;
    }

    private var _locID:uint;
    private var _flag:int = 0;

    public function set locID(value:uint):void {
        _locID = value;
    }

    public function set flag(value:int):void {
        _flag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_locID);
            bodyBytes.writeByte(_flag);
        } catch (e:*) {

        }
    }
}
}