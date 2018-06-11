package net.data.recvMsg.saysay {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.saysay.SayItemStruct;
import net.utils.BytesUtil;

public class SaysayUpdateMsg extends BaseMsg {
    public var type:uint;
    public var list:Array;
    public var item:SayItemStruct;

    public function SaysayUpdateMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 0:
                toType0(bytes);
                break;
            case 1:
                toType1(bytes);
                break;
        }

        return true;
    }

    private function toType0(bytes:ByteArray):void {
        item = new SayItemStruct();
        item.index = BytesUtil.readByte1(bytes);
        item.stutas = BytesUtil.readByte1(bytes);
        return;
    }

    private function toType1(bytes:ByteArray):void {
        var len:uint = BytesUtil.readByte1(bytes);
        var itemStruct:SayItemStruct;
        var pos:uint = 0;
        var index:uint = 0;
        list = [];
        for (var i:uint = 0; i < len; i++) {
            pos = i;
            index = pos + 1;
            itemStruct = new SayItemStruct();
            itemStruct.index = index;
            itemStruct.stutas = BytesUtil.readByte1(bytes);
            list[pos] = itemStruct;
        }
        return;
    }
}
}