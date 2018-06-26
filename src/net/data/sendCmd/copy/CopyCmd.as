/**
 * Created by dingcj on 2018/6/25.
 */
package net.data.sendCmd.copy {
import net.data.BaseCmd;
import net.events.MsgConst;

public class CopyCmd extends BaseCmd {

    public var param1:String = "";

    public function CopyCmd() {
        super();
        this.protocolID = MsgConst.COPY_DATA;
    }

    override public function msgToJson():Boolean {
        json = {
            protocolId: protocolID,
            client1: param1
        }
        return true;
    }
}
}
