package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author user
 */
public class TrumpUpgradeMsg extends BaseMsg {
    public function TrumpUpgradeMsg() {
        super();
    }

    private var _fighterId:int;
    private var _result:int;
    private var _itemID:Number;
    public var blessCount:uint;

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
            if (_result == 3) {
                blessCount = BytesUtil.readByte1(bytes);
            } else {
                _fighterId = BytesUtil.readByte2(bytes);
                _itemID = BytesUtil.readBigInt(bytes);
            }
        } catch (e:*) {

        }
        return true;
    }
}
}
