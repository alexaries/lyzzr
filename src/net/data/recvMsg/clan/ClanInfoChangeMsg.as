package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 类型  0x95
 * @author RyanCao
 *
 */
public class ClanInfoChangeMsg extends BaseMsg {
    public function ClanInfoChangeMsg() {
        super();
    }

    private var _flag:int;
    private var _result:int;

    public function getResult():int {
        return _result;
    }

    public function getFlag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            _result = BytesUtil.readByte1(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}