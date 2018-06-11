package net.data.recvMsg.camps {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 参加国战反馈
 * 消息协议 0x62
 * @author r.c
 *
 */
public class CampsJoinMsg extends BaseMsg {
    public function CampsJoinMsg() {
        super();
    }

    /**
     * byte    issucessable    参加退出操作是否成功
     *  0 - 成功
     *  1 - 异常
     * */
    private var _issucessable:int;

    public function getIssucessable():int {
        return _issucessable;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        // 解析
        _issucessable = BytesUtil.readByte1(bytes);
        return true;
    }
}
}