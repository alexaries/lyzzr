package net.data.sendCmd.clan {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CDepotCmd extends BaseCmd {
    private var _type:int;
    private var _pid:BigInteger = BigInteger.nbv(0);
    public var itemid:int;
    public var itemnum:int;

    public function CDepotCmd() {
        super();
        super.msgType = MsgConst.CLAN_DEPOT;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            if (_type == 2) {
                BytesUtil.writeUint64(bodyBytes, _pid);
                bodyBytes.writeShort(itemid);
                bodyBytes.writeShort(itemnum);
            }
        } catch (e:*) {
        }
    }

    public function set type(type:int):void {
        _type = type;
    }

    public function set pid(pid:BigInteger):void {
        _pid = pid;
    }
}
}
