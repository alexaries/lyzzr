package net.data.sendCmd.carrer {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CarrerCmd extends BaseCmd {
    public var type:int;
    public var flag:uint;
    public var startID:int;
    public var count:int;

    public var carrer:uint;
    public var phase:uint;

    public function CarrerCmd() {
        super();
        msgType = MsgConst.CARRER;
        flag = 0x01;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(flag);
            bodyBytes.writeByte(type);

            bodyBytes.writeByte(carrer);
            bodyBytes.writeByte(phase);
        } catch (e:Error) {
        }
    }
}
}
