package net.data.recvMsg.guide {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author john
 */
public class LeaveExpGetMsg extends BaseMsg {
    public var exp:uint;
    /*
     * 修为
     */
    public var exp1:uint;
    public var goodsList:Array;

    public function LeaveExpGetMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        exp = bytes.readUnsignedInt();
        exp1 = bytes.readUnsignedInt();
        goodsList = [];
        var len:uint = BytesUtil.readByte1(bytes);
        var goodsId:uint;
        for (var i:uint = 0; i < len; i++) {
            goodsId = BytesUtil.readByte2(bytes);
            goodsList.push(goodsId);
        }

        return true;
    }
}
}
