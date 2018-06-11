package net.data.recvMsg.secretbook {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.secretbook.SecretbookStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xB0 商城物品列表
 */
public class SecretbookMsg extends BaseMsg {
    public var type:uint;
    public var list:Array = [];
    public var award:Array = [];
    public var change:SecretbookStruct;
    public var index:uint;

    public function SecretbookMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
//			try {
        list = [];
        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 0:
                toType0(bytes);
                break;
            case 1:
                toType1(bytes);
                break;
            case 2:
                toType2(bytes);
                break;
        }
        // _type = BytesUtil.readByte1(bytes);
        // var _count:uint = BytesUtil.readByte1(bytes);
        // _itemList = [];
        // var itemInfo:ItemInfo;
        // for(var i:uint = 0;i<_count;i++)
        // {
        // itemInfo = new ItemInfo();
        // itemInfo.itemId = BytesUtil.readByte2(bytes);
        // itemInfo.price = BytesUtil.readByte2(bytes);
        // _itemList.push(itemInfo);
        // }
//			} catch(e : *) {
//			}
        return true;
    }

    private function toType0(bytes:ByteArray):void {
        var i:uint;
        var j:uint;
        var k:uint;
        var l:uint;
        var item:SecretbookStruct;
        var chapter_len:uint;
        var diff_len:uint;
        var group_len:uint;
        var award_len:uint;
        list = [];
        award = [];
        chapter_len = BytesUtil.readByte1(bytes);
        diff_len = BytesUtil.readByte1(bytes);
        for (i = 0; i < chapter_len; i++) {
            for (j = 0; j < diff_len; j++) {
                group_len = BytesUtil.readByte1(bytes);
                for (k = 0; k < group_len; k++) {
                    item = new SecretbookStruct();
                    item.chapter = i;
                    item.diff = j;
                    item.group = k;
                    item.list = [0, 0, 0];
                    item.list[0] = BytesUtil.readByte1(bytes);
                    item.list[1] = BytesUtil.readByte1(bytes);
                    item.list[2] = BytesUtil.readByte1(bytes);
                    //trace("??+>>>>",i,j,k,"    :",item.list);
                    list.push(item);
                }
            }
        }
        award_len = BytesUtil.readByte1(bytes);
        for (l = 0; l < award_len; l++) {
            award[l] = BytesUtil.readByte1(bytes);
        }
    }

    private function toType1(bytes:ByteArray):void {
        change = new SecretbookStruct();
        change.chapter = BytesUtil.readByte1(bytes);
        change.diff = BytesUtil.readByte1(bytes);
        change.group = BytesUtil.readByte1(bytes);
        index = BytesUtil.readByte1(bytes);
    }

    private function toType2(bytes:ByteArray):void {
        index = BytesUtil.readByte1(bytes);
    }
}
}