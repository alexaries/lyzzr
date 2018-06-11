package net.data.sendCmd.clan {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 *  消息协议 ：0x64
 *
 * @author RyanCao
 *
 */
public class ClanOperateCmd extends BaseCmd {
    public function ClanOperateCmd() {
        super();
        this.msgType = MsgConst.CLAN_OPERATE;
    }

    private var _type:int;
    private var _userid:BigInteger = BigInteger.nbv(0);
    private var _name:String;
    private var _post:int;

    public function set name(value:String):void {
        _name = value;
    }

    public function set type(value:int):void {
        _type = value;
    }

    public function set userid(value:BigInteger):void {
        _userid = value;
    }

    public function set post(post:int):void {
        _post = post;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            switch (_type) {
                case 0:
                    BytesUtil.writeUserName(_name, bodyBytes);
                    break;
                case 6:
                    BytesUtil.writeUint64(bodyBytes, _userid);
                    bodyBytes.writeByte(_post);
                    break;
                default:
                    BytesUtil.writeUint64(bodyBytes, _userid);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}