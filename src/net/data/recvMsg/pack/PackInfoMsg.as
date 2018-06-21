package net.data.recvMsg.pack {
import globals.ConfigLocator;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.zhenyuan.ZhenyuanStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x30 包裹列表
 */
public class PackInfoMsg extends BaseMsg {
    /**物品修改数据结构。如果itemStruct.itemNums为零则表示删除指定物品*/
    public var itemList:Array;

    public function PackInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        return true;
    }
}

}