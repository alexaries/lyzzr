package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 0x6D
 * @author RyanCao
 *
 */
public class ClanQQMsg extends BaseMsg {
    public var type:int;
    public var openid:String;
    public var bindQQ:Boolean;

    public function ClanQQMsg() {
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
            type = BytesUtil.readByte1(bytes);
            if (type == 1) {
                openid = bytes.readUTF();
                _flag = BytesUtil.readByte1(bytes);
                if (_flag == 1) {
                    bindQQ = true;
                }
            } else {
                _flag = BytesUtil.readByte1(bytes);
            }
        } catch (e:*) {

        }
        return true;
    }
}
}