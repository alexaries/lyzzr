package net.data.recvMsg.map {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * 消息id: 0x51
 * 据点定位,据点移动到的位置
 */
public class LocateSmallMapMsg extends BaseMsg {

    public function LocateSmallMapMsg() {
    }

    private var _locID:int;

    public function getLocID():int {
        return _locID;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        bytes.position = 0;
        _locID = bytes.readUnsignedShort();
        return true;
    }
}
}