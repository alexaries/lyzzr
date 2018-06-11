package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SeekingCmd extends BaseCmd {
    public var token:uint;
    public var context:String;

    public function SeekingCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(0x00);
            this.bodyBytes.writeByte(token);
            this.bodyBytes.writeUTF(context);
        }
        catch (e:*) {

        }
        return;
    }
}
}