/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.recvMsg.tavern {
import net.data.BaseMsg;

public class TavernMsg extends BaseMsg {

    public function TavernMsg() {
        super();
    }

    override public function jsonToMsg(json:JSON):Boolean {
        return true;
    }
}
}