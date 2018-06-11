package net.data.recvMsg.shop {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.shop.ItemInfo;
import net.utils.BytesUtil;

/**
 * (S->C) 0xB0 商城物品列表
 */
public class ShopListMsg extends BaseMsg {
    /**
     * 类型
     * 1-热卖
     * 2-宝石
     * 3-杂物
     * 4-礼券
     */
    private var _type:uint = 0;
    private var _itemList:Array;

    public function ShopListMsg() {
        super();
    }

    public function get itemList():Array {
        return _itemList;
    }

    public function get type():uint {
        return _type;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var _count:uint = BytesUtil.readByte1(bytes);
            _itemList = [];
            var itemInfo:ItemInfo;
            for (var i:uint = 0; i < _count; i++) {
                itemInfo = new ItemInfo();
                itemInfo.itemId = BytesUtil.readByte2(bytes);
                itemInfo.priceId = BytesUtil.readByte2(bytes);
                itemInfo.price = BytesUtil.readByte2(bytes);
                _itemList.push(itemInfo);
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}