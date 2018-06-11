package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * <code>(C->S)</code>协议消息  0x90
 * @author RyanCao
 *
 */
public class ClanReqListCmd extends BaseCmd {
    private var _flag:int;

    public function ClanReqListCmd() {
        super();
        this.msgType = MsgConst.CLAN_LIST;
    }

    private var _startID:int;
    private var _count:int;

    private var _type:int;

    private var _name:String;


    public function set name(value:String):void {
        _name = value;
    }

    public function set type(value:int):void {
        _type = value;
    }

    public function set count(value:int):void {
        _count = value;
    }

    public function set startID(value:int):void {
        _startID = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            if (_type != 0) {
                _startID = 0;
                _count = 0;
            }
            bodyBytes.writeShort(_startID);
            bodyBytes.writeByte(_count);
            bodyBytes.writeByte(_flag);
            if (_type == 0) {
                _name = "";
            }
//				bodyBytes.writeUTF(_name);
            BytesUtil.writeUserName(_name, bodyBytes);

        } catch (e:*) {

        }
    }

    public function set flag(flag:int):void {
        _flag = flag;
    }
}
}