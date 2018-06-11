package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 批量分解协议<br>
 * 协议号 0x49
 *
 */
public class EqBatchDecomposeMsg extends BaseMsg {
    public function EqBatchDecomposeMsg() {
        super();
    }

    private var _idArr:Array;
    public var count:uint;
    public var flag:int;

    public function get idArr():Array {
        return _idArr;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            flag = BytesUtil.readByte1(bytes);
            count = BytesUtil.readByte2(bytes);
            _idArr = new Array();
            var arr:Array;
            for (var i:int = 0; i < count; i++) {
                arr = new Array();
                arr.push(BytesUtil.readByte2(bytes));
                arr.push(BytesUtil.readByte2(bytes));
                _idArr.push(arr);
            }
        } catch (e:*) {

        }
        return true;
    }
}
}