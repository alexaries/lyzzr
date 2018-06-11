package net.data.recvMsg.pack {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x34 返回扩展背包
 */
public class PackExtendMsg extends BaseMsg {
    /**
     * 得到背包容量(0玩家背包 1魂魄背包)
     */
    public var capacity:uint = 0;

    public var type:int;

    public function PackExtendMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            capacity = BytesUtil.readByte2(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}