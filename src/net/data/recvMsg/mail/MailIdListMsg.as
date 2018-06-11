package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA6 返回邮件ID列表
 */
public class MailIdListMsg extends BaseMsg {
    public var pageIndex:uint = 0;
    public var count:uint = 0;
    public var totalCount:uint = 0;
    public var mailIdList:Array;

    public function MailIdListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            mailIdList = [];
            pageIndex = BytesUtil.readByte1(bytes);
            count = BytesUtil.readByte1(bytes);
            totalCount = BytesUtil.readByte2(bytes);
            for (var i:uint = 0; i < count; i++)
                mailIdList.push(bytes.readUnsignedInt());
        }
        catch (e:*) {

        }
        return true;
    }
}
}