package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author user
 */
public class TrumpMeltMsg extends BaseMsg {
    public function TrumpMeltMsg() {
        super();
    }

    private var _fighterId:int;
    private var _result:int;
    private var _itemID:Number;

    public function get itemID():Number {
        return _itemID;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    public function get result():int {
        return _result;
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
