package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C-S 0x27 解雇散仙)
 */
public class FireHeroCmd extends BaseCmd {
    public function FireHeroCmd() {
        super();
        msgType = MsgConst.FIRE_HERO;
    }

    private var _heroID:uint;

    public function set heroID(value:uint):void {
        _heroID = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(_heroID);
        } catch (e:*) {

        }
    }
}
}