package net.data.sendCmd.friend {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xA9 好友操作
 */
public class FriendMoodCmd extends BaseCmd {
    public var type:uint = 0;
    public var moodIndex:uint = 0;
    public var moodDesc:String = "";
    public var userName:String = "";
    public var result:uint = 0;

    public function FriendMoodCmd() {
        this.msgType = MsgConst.FRIEND_MOOD;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            switch (type) {
                case 0x00:
                    break;
                case 0x01:
                    this.bodyBytes.writeByte(moodIndex);
                    break;
                case 0x02:
                    break;
                case 0x03:
                    this.bodyBytes.writeUTF(moodDesc);
                    break;
                case 0x04:
                    //this.bodyBytes.writeUTF(userName);
                    BytesUtil.writeUserName(userName, bodyBytes);
                    break;
                case 0x05:
                    //this.bodyBytes.writeUTF(userName);
                    BytesUtil.writeUserName(userName, bodyBytes);
                    this.bodyBytes.writeByte(result);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}