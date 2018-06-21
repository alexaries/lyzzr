package net.data.recvMsg.trade {
import globals.ConfigLocator;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.trade.TradeSaleListStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * @author hokenny
 */
public class TradeSaleListMsg extends BaseMsg {
    public var tradeArr:Array;

    public function TradeSaleListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        return true;
    }
}
}
