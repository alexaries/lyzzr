package net.data.recvMsg.babel {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C)消息类型 0x5C<br>
 * 自动爬塔返回信息
 *
 */

public class BabelEndFightMsg extends BaseMsg {
    /*
     类型	名称	说明
     byte	type	0-结束 1-继续

     ushort	gold	元宝消耗
     ushort	coupon	礼券消耗

     */
    public var type:int;
    public var gold:int;
    public var counpon:int;

    public function BabelEndFightMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        gold = BytesUtil.readByte2(bytes);
        counpon = BytesUtil.readByte2(bytes);

        return true;
    }


}
}