package net.data.sendCmd.sort {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xE8 请求排行榜
 */
public class SortListCmd extends BaseCmd {
    private var _type:uint = 0;

    private var _reqId:uint = 0;

    public function SortListCmd() {
        this.msgType = MsgConst.SORT_LIST;
    }

    /**
     * 请求编号,为0时强行请求
     */
    public function get reqId():uint {
        return _reqId;
    }

    public function set reqId(value:uint):void {
        _reqId = value;
    }

    /**
     *  类型
     * 1-荣誉
     * 2-等级
     * 3-金钱
     * 4-战功
     * 5-宗族
     * 6-宝具
     * 7-人气
     */
    public function get type():uint {
        return _type;
    }

    public function set type(value:uint):void {
        _type = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            bodyBytes.writeUnsignedInt(reqId);
        }
        catch (e:*) {

        }
    }
}
}