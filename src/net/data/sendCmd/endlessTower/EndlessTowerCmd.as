package net.data.sendCmd.endlessTower {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author ryan
 */
public class EndlessTowerCmd extends BaseCmd {
    public var type:int = 0;
    public var level:int;
    public var start:int;
    public var count:int;
    public var fType:int;
    public var itemID:int;

    public function EndlessTowerCmd() {
        super();
        msgType = MsgConst.ENDLESS_TOWER;
    }


    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0:
                    break;
                case 1:
                    bodyBytes.writeShort(level);
                    break;
                case 2:
                    bodyBytes.writeShort(start);
                    bodyBytes.writeShort(count);
                    break;
                case 3:
                    bodyBytes.writeByte(count);
                    break;
                case 4:
                    bodyBytes.writeByte(count);
                    break;
                case 5:
                    bodyBytes.writeShort(level);
                    bodyBytes.writeByte(fType);
                    break;
                case 6:
                    break;
                case 7:
                    bodyBytes.writeShort(count);
                    break;
                case 8:
                    break;
                case 9:
                    bodyBytes.writeByte(fType);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}
