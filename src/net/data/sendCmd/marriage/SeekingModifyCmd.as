package net.data.sendCmd.marriage {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SeekingModifyCmd extends BaseCmd {
    public var type:uint;
    public var tokenId:uint;
    public var context:String;

    public function SeekingModifyCmd() {
        this.msgType = MsgConst.MARRIAGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x03);
            this.bodyBytes.writeByte(0x02);
            this.bodyBytes.writeByte(type);
            switch (type) {
                case 0:
                    this.bodyBytes.writeByte(tokenId);
                    break;
                case 1:
                    this.bodyBytes.writeUTF(context);
                    break;
            }
        }
        catch (e:*) {

        }
        return;
    }
}
}