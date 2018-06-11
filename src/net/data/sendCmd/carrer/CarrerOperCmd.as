package net.data.sendCmd.carrer {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CarrerOperCmd extends BaseCmd {
    public var flag:uint;
    public var fighterId:uint;
    public var operation:int;
    public var position:int;
    public var group:int;
    public var reportID:uint;
    public var state:int;
    public var tael:int;
    public var p_id:BigInteger;

    public function CarrerOperCmd() {
        super();
        msgType = MsgConst.CARRER;
        flag = 0x00;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(flag);
            bodyBytes.writeByte(operation);
            switch (operation) {
                case 1:
                    bodyBytes.writeByte(fighterId);
                    break;
                case 2:
                    bodyBytes.writeUnsignedInt(reportID);
                    break;
                case 3:
                    bodyBytes.writeUnsignedInt(reportID);
                    break;
                default:
            }
        } catch (e:Error) {
        }
    }
}
}
