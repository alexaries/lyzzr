package net.data.sendCmd.shop {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xB1 购买商城物品
 */
public class BuyGoodsCmd extends BaseCmd {
    private var _type:uint = 0;
    private var _itemId:uint = 0;
    private var _count:uint = 0;

    public function BuyGoodsCmd() {
        this.msgType = MsgConst.STORE_BUY;
    }

    public function set type(value:uint):void {
        _type = value;
    }

    public function set count(value:uint):void {
        _count = value;
    }

    public function set itemId(value:uint):void {
        _itemId = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(_type);
            this.bodyBytes.writeShort(_itemId);
            this.bodyBytes.writeShort(_count);
        }
        catch (e:*) {

        }
    }
}
}