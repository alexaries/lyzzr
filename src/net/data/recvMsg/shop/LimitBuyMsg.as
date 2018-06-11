package net.data.recvMsg.shop {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class LimitBuyMsg extends BaseMsg {
    public var flag1:uint;
    public var flag2:uint;
    public var flag3:uint;
    public var time1:uint;
    public var time2:uint;
    public var time3:uint;
    public var count1:uint;
    public var count2:uint;
    public var count3:uint;
    public var exType1:uint;
    public var exGold1:uint;
    public var exType2:uint;
    public var exGold2:uint;
    public var exType3:uint;
    public var exGold3:uint;

    public function LimitBuyMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            flag1 = BytesUtil.readByte1(bytes);
            exType1 = BytesUtil.readByte1(bytes);
            exGold1 = bytes.readUnsignedInt();
            time1 = bytes.readUnsignedInt();
            count1 = bytes.readUnsignedInt();

            flag2 = BytesUtil.readByte1(bytes);
            exType2 = BytesUtil.readByte1(bytes);
            exGold2 = bytes.readUnsignedInt();
            time2 = bytes.readUnsignedInt();
            count2 = bytes.readUnsignedInt();

            flag3 = BytesUtil.readByte1(bytes);
            exType3 = BytesUtil.readByte1(bytes);
            exGold3 = bytes.readUnsignedInt();
            time3 = bytes.readUnsignedInt();
            count3 = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
        return true;
    }
}
}
