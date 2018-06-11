package net.data.sendCmd.bookShop {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0x1A 查询书商
 */
public class RequestBossListCmd extends BaseCmd {
    private var _type:uint = 0;
    private var _color:uint = 2;
    private var _count:uint = 0;

    public function RequestBossListCmd() {
        this.msgType = MsgConst.BOOK_LIST;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (color > 2 && count > 0) {
                bodyBytes.writeByte(color);
                bodyBytes.writeShort(count);
            }
        }
        catch (e:*) {

        }
    }

    public function get type():uint {
        return _type;
    }

    public function set type(value:uint):void {
        _type = value;
    }

    public function get count():uint {
        return _count;
    }

    public function set count(value:uint):void {
        _count = value;
    }

    public function get color():uint {
        return _color;
    }

    public function set color(value:uint):void {
        _color = value;
    }
}
}