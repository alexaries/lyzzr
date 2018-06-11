package net.data.structs.mail {
public class MailStruct {
    /**编号*/
    public var mailId:uint = 0;
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
     * 0x12 - 将领修炼
     * 0x21 - 系统名将
     * 0x31 - 系统奖励
     * 0x80 - 已阅读
     * 0x29 -喜从天降帮派 接收奖励后直接发感谢
     * 0x30 - 喜从天降世界  接收奖励后直接发感谢
     */
    public var type:uint = 0;
    /**标题*/
    public var title:String = "";

    public var hasItem:uint = 0;

    public function MailStruct() {
    }
}
}