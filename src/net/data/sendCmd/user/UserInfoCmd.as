package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 请求 用户信息 0x14
 * @author r.c
 *
 */
public class UserInfoCmd extends BaseCmd {
    public function UserInfoCmd() {
        this.msgType = MsgConst.USER_INFO;
    }

    override protected function createBody():void {
        try {
//				this.bodyBytes.writeShort(locID);
        }
        catch (e:*) {

        }
    }
}
}