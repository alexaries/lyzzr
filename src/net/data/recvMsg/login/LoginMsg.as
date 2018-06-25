/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.recvMsg.login {
import net.data.BaseMsg;

public class LoginMsg extends BaseMsg {

    private var _charname:String = "";

    public function LoginMsg() {
        super();
    }

    override public function jsonToMsg(json:JSON):Boolean {
        _charname = "";
        return true;
    }
}
}
