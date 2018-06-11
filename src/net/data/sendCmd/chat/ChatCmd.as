package net.data.sendCmd.chat {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xF0 发送聊天
 */
public class ChatCmd extends BaseCmd {
    /**
     * 频道类型
     * @see #ChatStruct
     */
    private var _channelType:uint = 0;
    /**
     * 消息体
     */
    private var _bodyMsg:String = "";

    public function ChatCmd(type:int = 0) {
        this.msgType = MsgConst.CHAT;
    }

    public function get bodyMsg():String {
        return _bodyMsg;
    }

    public function set bodyMsg(value:String):void {
        _bodyMsg = value;
    }

    public function get channelType():uint {
        return _channelType;
    }

    public function set channelType(value:uint):void {
        _channelType = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(channelType);
            bodyBytes.writeUTF(bodyMsg);
        }
        catch (e:*) {

        }
    }
}
}