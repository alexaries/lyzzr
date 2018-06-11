/**
 * Created by dingcj on 2017/12/18.
 */
package net.data.sendCmd.tavern {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TavernInfoCmd extends BaseCmd {
    public function TavernInfoCmd() {
        this.msgType = MsgConst.HOTEL_LIST;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {
        }
    }
}
}
