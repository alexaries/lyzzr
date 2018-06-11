package net.data.recvMsg.guide {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * @author john
 */
public class AwardInfoMsg extends BaseMsg {
    public var type:uint;
    /*
     * 修为
     */
    public var info:uint;
    public var happy:uint;
    public var state:uint;
    public var gettedLv:uint;
    public var goodsId:uint;
    public var status:uint;
    public var receive1:uint;
    public var receive2:uint;
    public var isGet:uint;
    public var vip:uint;
    public var count:int;
    /**
     *
     *byte    t    1:蓝钻，2黄钻 3 Q会员 4，红钻
     */
    public var lotteryPf:int;
    /**
     *byte    count    已抽奖次数
     */
    public var lotteryNum:int;

    public var luckTableNYData:Array = [];

    public function AwardInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 1:
                info = BytesUtil.readByte1(bytes);
                break;
            case 2:
                happy = bytes.readUnsignedInt();
                state = bytes.readUnsignedByte();
                goodsId = bytes.readUnsignedShort();
                status = bytes.readUnsignedByte();
                break;
            case 3:
                goodsId = BytesUtil.readByte1(bytes);
                break;
            case 4:
                goodsId = BytesUtil.readByte1(bytes);
                break;
            case 5:
                isGet = BytesUtil.readByte1(bytes);
                break;
            case 6:
            case 11:
            case 12:
                goodsId = bytes.readUnsignedByte();
                break;
            case 7:
            case 8:
            case 9:
            case 15:
                state = BytesUtil.readByte1(bytes);
                break;
            case 13:
                receive1 = BytesUtil.readByte1(bytes);
                receive2 = BytesUtil.readByte1(bytes);
                break;
            case 14:
                state = BytesUtil.readByte1(bytes);
                break;
            case 16:
                vip = bytes.readUnsignedByte();
                goodsId = bytes.readUnsignedByte();
                count = bytes.readInt();
                break;
            case 17:
                lotteryPf = BytesUtil.readByte1(bytes);
                lotteryNum = BytesUtil.readByte1(bytes);
                break;
            case 18:
//                state = bytes.readByte();
//                happy = bytes.readByte();
                gettedLv = BytesUtil.readByte1(bytes);
                break;
            case 19:
            case 20:
            case 21:
                state = BytesUtil.readByte1(bytes);
                break;
            case 23:
                state = BytesUtil.readByte1(bytes)
                break;
            case 24:
                count = bytes.readInt();
                break;
            case 22:
                state = BytesUtil.readByte1(bytes);
                break;
            case 25:
                state = bytes.readInt();
                break;
            case 26:
                state = bytes.readByte();
                break;
            case 28:
                state = bytes.readUnsignedInt();
                info = bytes.readByte();
                break;
            case 29:
                info = bytes.readByte();
                break;
            case 32:
                info = bytes.readByte();
                break;
            case 34:
                luckTableNYData[0] = bytes.readUnsignedInt();
                luckTableNYData[1] = bytes.readUnsignedInt();
                luckTableNYData[2] = bytes.readUnsignedInt();
                luckTableNYData[3] = bytes.readUnsignedByte();
                break;
            case 35:
                info = bytes.readByte();
                happy = bytes.readUnsignedInt();
                break;
        }

        return true;
    }
}
}
