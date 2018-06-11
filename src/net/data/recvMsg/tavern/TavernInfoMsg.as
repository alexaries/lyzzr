/**
 * Created by dingcj on 2017/12/18.
 */
package net.data.recvMsg.tavern {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class TavernInfoMsg extends BaseMsg {
    private var _freeTimes:int;//今日免费剩余次数
    private var _freeCD:int;//免费cd
    private var _goldNum:int;//必得金色散仙剩余次数
    private var _goldCD:int;//仙石cd

    public function TavernInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _freeTimes = BytesUtil.readByte1(bytes);
            _freeCD = bytes.readUnsignedInt();
            _goldNum = BytesUtil.readByte1(bytes);
            _goldCD = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
    }

    public function get freeTimes():int {
        return _freeTimes;
    }

    public function get freeCD():int {
        return _freeCD;
    }

    public function get goldNum():int {
        return _goldNum;
    }

    public function get goldCD():int {
        return _goldCD;
    }
}
}
