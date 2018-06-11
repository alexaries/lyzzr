package net.data.recvMsg.trade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.trade.TradeListStruct;
import net.utils.BytesUtil;

public class TradeListMsg extends BaseMsg {
    private var _tradeArr:Array;

    public function TradeListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _tradeArr = [];
        var index:uint = BytesUtil.readByte2(bytes);
        var num:uint = BytesUtil.readByte2(bytes);
        var totalNum:uint = BytesUtil.readByte2(bytes);

        var tradeStruct:TradeListStruct;
        var tradeInfo:Array = new Array();
        for (var i:uint = 0; i < num; i++) {
            tradeStruct = new TradeListStruct();
            tradeStruct.id = bytes.readUnsignedInt();
            tradeStruct.userName = BytesUtil.readUserName(bytes);
            tradeStruct.title = bytes.readUTF();
            tradeStruct.state = BytesUtil.readByte1(bytes);
            tradeStruct.time = bytes.readUnsignedInt();
            tradeInfo.push(tradeStruct);
        }
        _tradeArr.push(index);
        _tradeArr.push(num);
        _tradeArr.push(totalNum);
        _tradeArr.push(tradeInfo);

        return true;
    }

    public function getTradeListVO():Array {
        return _tradeArr;
    }
}
}