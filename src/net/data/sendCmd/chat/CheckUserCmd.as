package net.data.sendCmd.chat {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xF2 寻找玩家
 */
public class CheckUserCmd extends BaseCmd {
    /**
     * 玩家名
     */
    private var _userName:String;

    public function CheckUserCmd() {
        this.msgType = MsgConst.CHECK_USER;
    }

    public function get userName():String {
        return _userName;
    }

    public function set userName(value:String):void {
        _userName = value;
    }

    override protected function createBody():void {
        try {
//				this.bodyBytes.writeUTF(userName)
            BytesUtil.writeUserName(userName, bodyBytes);
        }
        catch (e:*) {

        }
    }

}
}