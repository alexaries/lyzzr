package net.data.recvMsg.clan {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 0x94
 * @author RyanCao
 *
 */
public class ClanOperateMsg extends BaseMsg {
    public function ClanOperateMsg() {
        super();
    }

    private var _flag:int;
    private var _result:int;
    private var _userid:BigInteger = BigInteger.nbv(0);

    public function getFlag():int {
        return _flag;
    }

    public function getResult():int {
        return _result;
    }

    public function getUserid():BigInteger {
        return _userid;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            _result = BytesUtil.readByte1(bytes);
            if (_flag != 0 && _flag != 6) {
                var idBytes:ByteArray = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                _userid = BytesUtil.readUint64(idBytes);
            }
        } catch (e:*) {

        }
        return true;
    }
}
}