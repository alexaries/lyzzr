package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 新手引导进度
 * 协议类型  --- 0x13
 * @author RyanCao
 *
 */
public class NewsPlayerProcessMsg extends BaseMsg {
    public function NewsPlayerProcessMsg() {
        super();
    }

    private var _state:int;

    /**<br>
     * 1 - 第一次HP受损<br>
     * 2 - 第一次死亡
     * @return
     *
     */
    public function get state():int {
        return _state;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _state = BytesUtil.readByte2(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}