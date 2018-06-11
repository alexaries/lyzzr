package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息类型  0x95
 * @author RyanCao
 *
 */
public class ClanInfoChangeCmd extends BaseCmd {
    public function ClanInfoChangeCmd() {
        super();
        this.msgType = MsgConst.CLAN_INFO_CHANGE;
    }

    private var _type:int;
    private var _str:String;

    public function set str(value:String):void {
        _str = value;
    }

    public function set type(value:int):void {
        _type = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            bodyBytes.writeUTF(_str);
        } catch (e:*) {

        }
    }
}
}