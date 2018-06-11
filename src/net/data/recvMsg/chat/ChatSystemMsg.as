package net.data.recvMsg.chat {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xF7 系统信息
 */
public class ChatSystemMsg extends BaseMsg {
    /**
     * 普通系统消息
     */
    public static const SYS_MSG_GENERAL:uint = 0x0;
    /**
     * 大喇叭信息
     */
    public static const SYS_MSG_LOAUDER:uint = 0x1;
    /**
     * 全世界信息
     */
    public static const SYS_MSG_WORLD:uint = 0x2;
    /**
     * 滚屏信息
     */
    public static const SYS_MSG_ROLL:uint = 0x3;
    /**
     * 0x4 -宗族消息
     */
    public static const CLAN_MSG_ROLL:uint = 0x4;
    /**
     * 0x5 -帮派战况通知消息
     */
    public static const CLAN_REPORT:uint = 0x5;
    /**
     * 0x6 -新通知消息
     */
    public static const OTHER_REPORT:uint = 0x6;
    /**
     * 0x7 -阵营消息
     */
    public static const SYS_MSG_CAMP:uint = 0x7;

    public static const SYS_MSG_CITY:int = 0x13
    /**
     * 消息类型
     * 0x0-普通系统消息
     * 0x1-大喇叭信息
     * 0x2-全世界信息
     */
    public var type:uint = 0;
    /**
     * 颜色
     */
    public var color:uint = 0;
    /**
     * 消息内容
     */
    public var content:String = "";

    public function ChatSystemMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            color = BytesUtil.readByte1(bytes);
            type = color >> 4;
            color &= 0x0F;
            content = bytes.readUTF();
        }
        catch (e:*) {

        }
        return true;
    }
}
}