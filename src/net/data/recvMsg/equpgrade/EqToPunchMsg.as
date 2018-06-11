package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 装备打孔消息协议<br>
 * (S->C)0x41
 * @author RyanCao
 *
 */
public class EqToPunchMsg extends BaseMsg {
    public function EqToPunchMsg() {
        super();
    }

    public function get itemID():Number {
        return _itemID;
    }

    public function get result():int {
        return _result;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    private var _result:int;
    private var _itemID:Number;
    private var _fighterId:int;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _result = BytesUtil.readByte1(bytes);
            _fighterId = BytesUtil.readByte2(bytes);
            _itemID = BytesUtil.readBigInt(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}