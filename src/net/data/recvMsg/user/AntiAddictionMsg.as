package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 防沉迷消息验证,消息id:0x12
 */
public class AntiAddictionMsg extends BaseMsg {
    /**
     * 0-不需要防沉迷
     * 1-需要防沉迷
     * 2-验证不成功
     */
    public var isWallowValid:uint = 0;
    /**
     * 0-全收益阶段
     * 1-半收益阶段
     * 2-无收益阶段
     */
    public var wallowStage:uint = 0;
    /**
     * 到下一个阶段的秒数
     */
    public var timeSec:uint = 0;

    public function AntiAddictionMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            isWallowValid = BytesUtil.readByte1(bytes);
            wallowStage = BytesUtil.readByte1(bytes);
            timeSec = bytes.readUnsignedInt();
        }
        catch (e:*) {

        }
        return true;
    }
}
}