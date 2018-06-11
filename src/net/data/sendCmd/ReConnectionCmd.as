/**
 * Created by huangcb on 2017/11/1.
 */
package net.data.sendCmd {
import net.data.BaseCmd;
import net.events.MsgConst;

public class ReConnectionCmd extends BaseCmd {

    public var userId:Number = 0;
    public var serverNo:String = "";
    public var platform:String = "";
    public var openkey:String = "";

    public function ReConnectionCmd() {
        super();
        this.msgType = MsgConst.RE_CONNECTION;
    }

    override protected function createBody():void {
        bodyBytes.writeUnsignedInt(userId);
        bodyBytes.writeUnsignedInt(userId / 0x100000000);
        bodyBytes.writeUTF(serverNo);
        bodyBytes.writeUTF(platform);
        bodyBytes.writeUTF(openkey);
    }
}
}
