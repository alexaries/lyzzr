package net.data.recvMsg.pack {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x33 使用物品返回
 */
public class PackUseMsg extends BaseMsg {
    public var itemId:uint = 0;
    public var type:Number = 0;
    public var success:uint = 0;

    public function PackUseMsg() {

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            this.itemId = bytes.readUnsignedInt();
            this.type = BytesUtil.readByte1(bytes);
            this.success = BytesUtil.readByte1(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}