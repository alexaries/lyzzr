package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class TaskHookMsg extends BaseMsg {
    public var npcId:uint;
    public var type:uint;
    public var count:uint;
    public var time:uint;
    public var max:uint;
    public var state:uint;

    public function TaskHookMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {


        npcId = bytes.readUnsignedInt();
        type = BytesUtil.readByte1(bytes);
        count = BytesUtil.readByte2(bytes);
        time = bytes.readUnsignedInt();
        max = BytesUtil.readByte1(bytes);
        if(time!=0)
            state = BytesUtil.readByte1(bytes);

        return true;
    }
}
}