/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.sendCmd.login {
import net.data.BaseCmd;
import net.events.MsgConst;

public class LoginCmd extends BaseCmd {

    public function LoginCmd() {
        super();
        protocolID = MsgConst.LOGIN;
    }

    override public function msgToJson():Boolean {



        return true;
    }
}
}