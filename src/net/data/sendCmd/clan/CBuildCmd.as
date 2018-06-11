package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 *  帮派驻地信息<br>
 * (C->S) 0x9B
 * @author ryan
 */
public class CBuildCmd extends BaseCmd {
    public function CBuildCmd() {
        super();
        super.msgType = MsgConst.CLAN_BUILD;
    }

    private var _type:int;
    private var _payMoney:int;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            switch (_type) {
                case 0:
                case 1:
                case 2:
                    break;
                case 3:
                case 4:
                    bodyBytes.writeByte(_payMoney);
                    break;
            }

        } catch (e:*) {

        }
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set payMoney(payMoney:int):void {
        _payMoney = payMoney;
    }
}
}
