/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.recvMsg.copy {
import net.data.BaseMsg;

public class CopyMsg extends BaseMsg {


    public function CopyMsg() {
        super();
    }

    override public function jsonToMsg(json:JSON):Boolean {
        return true;
    }
}
}