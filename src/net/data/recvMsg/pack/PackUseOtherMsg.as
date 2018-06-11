package net.data.recvMsg.pack {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xD7 对某玩家使用物品返回 <br>
 * @author ryan
 */
public class PackUseOtherMsg extends BaseMsg {
    public function PackUseOtherMsg() {
        super();
    }

    public var itemId:uint = 0;
    public var success:uint = 0;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            this.itemId = bytes.readUnsignedInt();
            this.success = BytesUtil.readByte1(bytes);
        } catch (e:*) {
        }
        return true;
    }
}
}
