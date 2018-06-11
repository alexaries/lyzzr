package net.data.sendCmd.clan {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CFightCmd extends BaseCmd {
    public function CFightCmd() {
        super();
        super.msgType = MsgConst.CLAN_FIGHT;
    }

    private var _type:int;
    private var _userid:BigInteger = BigInteger.nbv(0);
    private var _fightID:int;
    private var _pos:int;
    private var _skillID:int;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            switch (_type) {
                case 0:
                case 1:
                case 2:
                    break;
                case 3:
                    BytesUtil.writeUint64(bodyBytes, _userid);
                    bodyBytes.writeByte(_fightID);
                    bodyBytes.writeByte(_pos);
                    break;
                case 4:
                    bodyBytes.writeByte(_skillID);
                    break;
                case 5:
                    break;
                case 7:
                    bodyBytes.writeByte(_skillID);
                    break;
            }

        } catch (e:*) {

        }
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set userid(userid:BigInteger):void {
        _userid = userid;
    }

    public function set fightID(fightID:int):void {
        _fightID = fightID;
    }

    public function set pos(pos:int):void {
        _pos = pos;
    }

    public function set skillID(skillID:int):void {
        _skillID = skillID;
    }

}
}
