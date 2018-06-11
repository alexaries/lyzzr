package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 0x92
 * @author RyanCao
 *
 */
public class ClanCreateMsg extends BaseMsg {
    public function ClanCreateMsg() {
        super();
    }

    private var _flag:int;

    /**
     * 返回信息<br>
     *    0 - 创建成功<br>
     *    1 - 创建失败（宗族名已有）<br>
     *    2 - 创建失败（宗族名非法）<br>
     *    3 - 创建失败（其他原因）<br>
     * @return
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