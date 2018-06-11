package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class CFightPreCmd extends BaseCmd {
    public function CFightPreCmd() {
        super();
        super.msgType = MsgConst.CLAN_FIGHT_PRE;
    }

    private var _type:int;
    private var _fightID:int;
    private var _rank:int = -1;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            switch (_type) {
                case 0:
                case 2:
                case 3:
                case 4:
                case 8:
                    break;
                case 1:
                    bodyBytes.writeByte(_fightID);
                    break;
                case 9:
                    bodyBytes.writeByte(_fightID);
                    if(_rank != -1)
                       bodyBytes.writeShort(_rank);
                    break;
            }

        } catch (e:*) {

        }
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set fightID(fid:int):void {
        _fightID = fid;
    }
    public function set rank(rankNum:int):void {
        _rank = rankNum;
    }
}
}
