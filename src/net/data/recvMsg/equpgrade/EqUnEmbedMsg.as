package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 0x44
 * @author RyanCao
 *
 */
public class EqUnEmbedMsg extends BaseMsg {
    public function EqUnEmbedMsg() {
        super();
    }

    private var _result:int;
    private var _itemID:Number;
    private var _slot:int;
    private var _fighterId:int;

    /**
     *    拆卸位置 (1-6)
     * @return
     *
     */
    public function get slot():int {
        return _slot;
    }

    /**
     *装备ID
     * @return
     *
     */
    public function get itemID():Number {
        return _itemID;
    }

    /**
     *0-成功 1-拆卸损坏 2-无法拆卸
     * @return
     *
     */
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
            _slot = BytesUtil.readByte1(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}