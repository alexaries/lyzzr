package net.data.sendCmd.fighter {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x28 接受武将
 */
public class AcceptFighterCmd extends BaseCmd {
    /**
     * 邮件id
     */
    private var _mailId:uint = 0;
    /**
     * 武将id
     */
    private var _fighterId:uint = 0;

    public function AcceptFighterCmd() {
        this.msgType = MsgConst.ACCEPT_FIGHTER;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    public function get mailId():uint {
        return _mailId;
    }

    public function set mailId(value:uint):void {
        _mailId = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(mailId);
            this.bodyBytes.writeUnsignedInt(fighterId);
        }
        catch (e:*) {

        }
    }
}
}