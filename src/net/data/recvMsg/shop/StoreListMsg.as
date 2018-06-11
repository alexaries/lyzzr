package net.data.recvMsg.shop {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.shop.ItemInfo;
import net.utils.BytesUtil;

/**
 * (S->C) 0xB0 商城物品列表
 */
public class StoreListMsg extends BaseMsg {
    /**
     * 类型
     * 1-热卖
     * 2-宝石
     * 3-杂物
     * 4-礼券
     */
    private var _type:uint = 0;
    private var _itemList:Array;

    public function StoreListMsg() {
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

            if (_type == 1) {
                for (var i:uint = 0; i < _count; i++) {
                    itemInfo = new ItemInfo();
                    itemInfo.itemId = BytesUtil.readByte2(bytes);
                    itemInfo.flag = BytesUtil.readByte1(bytes);
                    itemInfo.left = bytes.readUnsignedInt();
                    itemInfo.beginTime = bytes.readUnsignedInt();
                    itemInfo.endTime = bytes.readUnsignedInt();
                    itemInfo.price = BytesUtil.readByte2(bytes);
                    itemInfo.oldPrice = BytesUtil.readByte2(bytes);
                    itemInfo.exType = BytesUtil.readByte1(bytes);
                    itemInfo.exGold = bytes.readUnsignedInt();
                    _itemList.push(itemInfo);
                }
            }
            else {
                for (var s:uint = 0; s < _count; s++) {
                    itemInfo = new ItemInfo();
                    itemInfo.itemId = BytesUtil.readByte2(bytes);
                    itemInfo.price = BytesUtil.readByte2(bytes);
                    if (type == 11 || type == 12 || type == 13 || type == 14 || type == 15 || type == 17) {
                        itemInfo.needScoreLevel = BytesUtil.readByte1(bytes);
                    }
                    _itemList.push(itemInfo);
                }
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}
