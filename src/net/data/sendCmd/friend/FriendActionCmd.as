package net.data.sendCmd.friend {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xA9 好友操作
 */
public class FriendActionCmd extends BaseCmd {
    /**
     * 操作类型,0x01:添加到好友,0x02:删除好友
     */
    private var _actionType:uint = 0;
    /**
     * 用户姓名
     */
    private var _userName:String = "";

    public function FriendActionCmd() {
        this.msgType = MsgConst.FRIEND_ACTION;
    }

    public function get userName():String {
        return _userName;
    }

    public function set userName(value:String):void {
        _userName = value;
    }

    public function get actionType():uint {
        return _actionType;
    }

    public function set actionType(value:uint):void {
        _actionType = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(actionType);
            BytesUtil.writeUserName(userName, bodyBytes);
        }
        catch (e:*) {

        }
    }
}
}