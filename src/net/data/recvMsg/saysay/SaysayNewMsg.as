package net.data.recvMsg.saysay {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.saysay.SayGet;
import net.data.structs.saysay.SayInfoList;
import net.data.structs.saysay.SayItemStruct;
import net.data.structs.saysay.SayNews;
import net.utils.BytesUtil;

public class SaysayNewMsg extends BaseMsg {
    public var type:uint;
    public var data:*;

    public function SaysayNewMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 0:
                data = SayItemStruct.read(bytes, new SayItemStruct)
                break;
            case 1:
                data = SayInfoList.read(bytes, new SayInfoList);
                break;
            case 2:
                data = SayNews.read(bytes, new SayNews);
                break;
            case 3:
                data = bytes.readUnsignedByte();
                break;
            case 4:
                data = SayGet.read(bytes, new SayGet);
                break;
            case 5:
                data = BytesUtil.readByte2(bytes);
                break;
            case 6:
                data = BytesUtil.readByte2(bytes);
                break;
        }

        return true;
    }
}
}