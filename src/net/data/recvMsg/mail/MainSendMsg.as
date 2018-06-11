package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA3 确认发送邮件
 */
public class MainSendMsg extends BaseMsg {
    /**
     * 邮件发送反馈
     * 发送结果:
     * 0 - 成功
     * 1 - 目标用户不存在
     * 2 - 其它发送失败
     */
    public var mailSendResult:uint = 0;

    public function MainSendMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            mailSendResult = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}