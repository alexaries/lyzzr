package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x29 点击武将回血按钮
 */
public class AddHpCmd extends BaseCmd {
    public var fighterId:uint = 0;

    public function AddHpCmd() {
        this.msgType = MsgConst.ADD_HP;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(fighterId);
        }
        catch (e:*) {

        }
    }
}
}