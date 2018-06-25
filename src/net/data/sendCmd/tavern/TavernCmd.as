/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.sendCmd.tavern {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TavernCmd extends BaseCmd {
    public function TavernCmd() {
        super();
        protocolID = MsgConst.HOTEL_LIST;
    }

    override public function msgToJson():Boolean {
        return true;
    }
}
}