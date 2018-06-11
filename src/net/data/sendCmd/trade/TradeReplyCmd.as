package net.data.sendCmd.trade {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class TradeReplyCmd extends BaseCmd {
    public var tradeId:uint = 0;
    public var coin:uint = 0;
    public var gold:uint = 0;
    public var itemNum:uint = 0;
    public var itemChange:Array = [];

    public function TradeReplyCmd() {
        this.msgType = MsgConst.TRADE_REPLY;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(tradeId);
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
