package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PlaceInfoCmd extends BaseCmd {
    public function PlaceInfoCmd() {
        this.msgType = MsgConst.PLACE_INFO;
    }

    override protected function createBody():void {
        try {
        }
        catch (e:*) {

        }
    }
}
}
