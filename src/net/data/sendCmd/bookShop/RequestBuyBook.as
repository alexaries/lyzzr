package net.data.sendCmd.bookShop {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (S->C) 0x1B 书商购买
 * */
public class RequestBuyBook extends BaseCmd {
    private var _pos:uint = 0;

    public function RequestBuyBook() {
        this.msgType = MsgConst.BOOK_BUY;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(pos);
        }
        catch (e:*) {

        }
    }

    public function get pos():uint {
        return _pos;
    }

    public function set pos(value:uint):void {
        _pos = value;
    }
}
}