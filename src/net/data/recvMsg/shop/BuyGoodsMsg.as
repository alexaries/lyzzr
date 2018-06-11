package net.data.recvMsg.shop {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xB1 购买反馈
 */
public class BuyGoodsMsg extends BaseMsg {
    /**
     * 0-购买成功
     * 1-资源不够
     * 2-数量超过背包上限
     * 3-物品ID无效
     */
    public var result:uint = 0;
    /**
     * 类型
     */
    public var type:uint = 0;
    /**
     * 物品ID
     */
    public var itemId:uint = 0;
    /**
     * 物品数量
     */
    public var count:uint = 0;
    /**
     * 消耗元宝/礼券
     */
    public var used:uint = 0;

    public function BuyGoodsMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
            type = BytesUtil.readByte1(bytes);
            itemId = BytesUtil.readByte2(bytes);
            count = BytesUtil.readByte2(bytes);
            used = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
        return true;
    }
}
}