package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class ActiveAwardCmd extends BaseCmd {
    public var type:uint = 0;
    public var awardState:uint = 0;
    public var awardItemID:uint = 0;
    public var awardItemNum:uint = 0;

    public var itemType:int = 0;
    public var itemKey:String = "";

    public function ActiveAwardCmd() {
        this.msgType = MsgConst.ACTIVE_AWARD;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 2:
                    bodyBytes.writeShort(awardState);
                    break;
                case 4:
                    bodyBytes.writeInt(awardItemID);
                    bodyBytes.writeInt(awardItemNum);
                    break;
                case 5:
                    bodyBytes.writeByte(itemType);
                    bodyBytes.writeUTF(itemKey);
                    break;
                default:
                    break;
            }
        }
        catch (e:*) {

        }
    }
}
}
