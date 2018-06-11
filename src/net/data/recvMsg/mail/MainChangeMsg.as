package net.data.recvMsg.mail {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA5 邮件改变
 */
public class MainChangeMsg extends BaseMsg {
    /**编号*/
    public var mainId:uint = 0;
    /**发送者*/
    public var sender:String = "";
    /**收到时间*/
    public var recvTime:uint = 0;
    /**邮件类型标志
     * 0x00 - 全部
     * 0x01 - 系统
     * 0x02 - NPC
     * 0x03 - 玩家
     * 0x04 - 战报
     * 0x11 - 系统野将
     * 0x21 - 系统名将
     * 0x31 - 系统奖励
     * 0x13 - 好友请求
     * 0x80 - 已阅读*/
    public var type:uint = 0;
    /**标题*/
    public var title:String = "";
    /**内容*/
    public var content:String = "";
    /**参数*/
    public var param:uint = 0;

    public function MainChangeMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            mainId = bytes.readUnsignedInt();
            sender = BytesUtil.readUserName(bytes);
            recvTime = bytes.readUnsignedInt();
            type = BytesUtil.readByte1(bytes);
            title = bytes.readUTF();
            content = bytes.readUTF();
            param = bytes.readUnsignedInt();

        }
        catch (e:*) {

        }
        return true;
    }
}
}