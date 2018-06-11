package net.data.recvMsg.tripod {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class TripodInfoMsg extends BaseMsg {
    /**
     * uint32	score	九疑鼎经验
     * uint16	lev	九疑鼎个位表示等级 十位以上阶数
     */
    public var exp:uint;
    public var id:int;
    public function TripodInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        exp = BytesUtil.readByte4(bytes);
        id = BytesUtil.readByte2(bytes);
        return true;
    }
}
}
