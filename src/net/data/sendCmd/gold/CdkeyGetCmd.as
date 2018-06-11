package net.data.sendCmd.gold {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class CdkeyGetCmd extends BaseCmd {
    public var cdkey:String = "";

    public function CdkeyGetCmd() {
        this.msgType = MsgConst.CDKEY_GET;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUTF(cdkey);
        }
        catch (e:*) {

        }
    }
}
}
