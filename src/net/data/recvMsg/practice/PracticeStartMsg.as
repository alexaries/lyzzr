package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PracticeStartMsg extends BaseMsg {
    /**0:加入修炼成功,1:移出修炼成功,2:操作失败*/
    public var type:uint = 0;
    public var fighterId:uint = 0;

    public function PracticeStartMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            fighterId = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
        return true;
    }
}
}
