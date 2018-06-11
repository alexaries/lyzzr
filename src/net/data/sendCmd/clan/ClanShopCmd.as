
package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;


public class ClanShopCmd extends BaseCmd {
    private var _type:int;

    public var _index:int;
    public function ClanShopCmd() {
        super();
        super.msgType = MsgConst.CLAN_COPY;
    }

    override protected function createBody():void {
        try {
                bodyBytes.writeByte(0x30);
                bodyBytes.writeByte(_type);
                bodyBytes.writeByte(_index);
        } catch (e:*) {
        }
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set index(pid:int):void {
        _index = pid;
    }
}
}

