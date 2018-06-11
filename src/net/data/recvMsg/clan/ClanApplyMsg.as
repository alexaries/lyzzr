package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息类型 0x93
 * @author RyanCao
 *
 */
public class ClanApplyMsg extends BaseMsg {
    public function ClanApplyMsg() {
        super();
    }

    private var _flag:int;

    /**
     *    消息是否发送成功<br>
     *    0 - 发送成功 服务器正在处理<br>
     *    1 - 异常
     * @return
     *
     */
    public function get flag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
        } catch (e:*) {

        }
        return true;
    }

}
}