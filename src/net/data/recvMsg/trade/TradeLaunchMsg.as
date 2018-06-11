package net.data.recvMsg.trade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class TradeLaunchMsg extends BaseMsg {
    public function TradeLaunchMsg() {
        super();
    }

    public var id:uint = 0;
    public var tradeName:String = "";
    public var title:String = "";
    public var state:uint = 0;
    public var time:uint = 0;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        id = bytes.readUnsignedInt();
        tradeName = BytesUtil.readUserName(bytes);
        title = bytes.readUTF();
        state = BytesUtil.readByte1(bytes);
        time = bytes.readUnsignedInt();

        return true;
    }

}
}