package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class TradeLaunchCmd extends BaseCmd {
    public var tradeTarget:String = "";
    public var tradeTitle:String = "";
    public var coin:uint = 0;
    public var gold:uint = 0;
    public var itemNum:uint = 0;
    public var itemChange:Array = [];

    public function TradeLaunchCmd() {
        this.msgType = MsgConst.TRADE_LAUNCH;
    }

    override protected function createBody():void {
        try {
            BytesUtil.writeUserName(tradeTarget, bodyBytes);
            this.bodyBytes.writeUTF(tradeTitle);
            this.bodyBytes.writeUnsignedInt(coin);
            this.bodyBytes.writeUnsignedInt(gold);
            this.bodyBytes.writeShort(itemNum);
            for (var i:uint = 0; i < itemChange.length; i++) {
                this.bodyBytes.writeUnsignedInt(itemChange[i][0]);
                this.bodyBytes.writeShort(itemChange[i][1]);
            }
        }
        catch (e:*) {

        }
    }
}
}
