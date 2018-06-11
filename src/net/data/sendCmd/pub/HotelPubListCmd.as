package net.data.sendCmd.pub {
import net.data.BaseCmd;
import net.events.MsgConst;

public class HotelPubListCmd extends BaseCmd {
    private var _type:uint = 0;
    private var _color:uint = 2;
    private var _count:uint = 0;

    public function HotelPubListCmd() {
        this.msgType = MsgConst.HOTEL_LIST;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(color);
            bodyBytes.writeShort(count);
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