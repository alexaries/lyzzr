package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class EqBatchDecompose extends BaseCmd {
    public function EqBatchDecompose() {
        msgType = MsgConst.EQ_DECOMPOSE;
    }

    private var _itemIdArr:Array;
    private var _flag:uint;

    public function set itemIdArr(value:Array):void {
        _itemIdArr = value;
    }

    public function set flag(value:uint):void {
        _flag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_flag);
            bodyBytes.writeShort(_itemIdArr.length);
            for each(var eqId:Number in _itemIdArr) {
                BytesUtil.writeBigInt(eqId, bodyBytes);
            }
        } catch (e:*) {

        }
    }
}
}