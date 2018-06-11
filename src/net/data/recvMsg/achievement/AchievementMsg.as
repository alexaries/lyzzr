package net.data.recvMsg.achievement {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 * 0x0C
 */
public class AchievementMsg extends BaseMsg {
    public var achievementArr:Array = [];

    public function AchievementMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        var len:int = BytesUtil.readByte2(bytes);
        achievementArr = [];
        for (var i:int = 0; i < len; i++) {
            achievementArr.push([BytesUtil.readByte2(bytes), BytesUtil.readByte4(bytes)]);
        }

        return true;
    }
}
}
