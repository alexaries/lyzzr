package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 装备镶嵌协议<br>
 * 0x43
 * @author RyanCao
 *
 */
public class EqEmbedMsg extends BaseMsg {
    public function EqEmbedMsg() {
        super();
    }

    private var _itemID:Number;
    private var _result:int;
    private var _fighterId:int;

    public function get result():int {
        return _result;
    }

    public function get itemID():Number {
        return _itemID;
    }

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