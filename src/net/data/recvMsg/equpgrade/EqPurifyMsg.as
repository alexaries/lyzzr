package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 装备洗練协议<br>
 * 0x47
 * @author RyanCao
 *
 */
public class EqPurifyMsg extends BaseMsg {
    public function EqPurifyMsg() {
        super();
    }

    private var _result:int;
    private var _itemID:Number;
    private var _fighterId:int;

    public function get itemID():Number {
        return _itemID;
    }

    public function get result():int {
        return _result;
    }

    /**
     *武将ID
     * 0表示在背包中
     *
     */
    public function get fighterId():uint {
        return _fighterId;
    }

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