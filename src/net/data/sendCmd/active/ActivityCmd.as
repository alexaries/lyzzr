package net.data.sendCmd.active {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class ActivityCmd extends BaseCmd {
    /**活动
     * */
    public var activityType:uint;
    /**七夕活动
     * */
    public var tanabateType:uint;
    /**七夕数据
     * */
    public var tanabateData:int;
    /**七夕数据
     * */
    public var tanabateData1:int;

    public var frieldId:BigInteger;
    /***/

    public function ActivityCmd() {
        super();
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        try {
            switch (activityType) {
                case 0x01:
                case 0x03:
                case 0x09:
                    bodyBytes.writeByte(activityType);
                    bodyBytes.writeByte(tanabateType);
                    //七夕
                    if (tanabateType == 0x01) {
                        bodyBytes.writeByte(tanabateData);
                    } else if (tanabateType == 0x02) {
                        bodyBytes.writeByte(tanabateData);
                        if (tanabateData == 0) {
                            BytesUtil.writeUint64(this.bodyBytes, frieldId);
                        }
                    } else if (tanabateType == 0x03) {
                        bodyBytes.writeByte(tanabateData);
                    }
                    break;
                case 0x05:
                    bodyBytes.writeByte(activityType);
                    bodyBytes.writeByte(tanabateType);
                    //
                    if (tanabateType == 0x01) {
                        bodyBytes.writeByte(tanabateData);
                    } else if (tanabateType == 0x02) {
                        bodyBytes.writeByte(tanabateData);
                        if (tanabateData == 0) {
                            BytesUtil.writeUint64(this.bodyBytes, frieldId);
                        }
                    } else if (tanabateType == 0x03) {
                        bodyBytes.writeInt(tanabateData);
                    } else if (tanabateType == 0x04) {
                        bodyBytes.writeShort(tanabateData);
                    }
                    break;
                case 0x0c:
                    bodyBytes.writeByte(activityType);
                    bodyBytes.writeByte(tanabateType);
                    if (tanabateType == 2)
                        bodyBytes.writeInt(tanabateData);
                    break;
                case 0x0e:
                    bodyBytes.writeByte(activityType);
                    bodyBytes.writeByte(tanabateType);
                    if (tanabateType == 2) {
                        bodyBytes.writeByte(tanabateData);
                        bodyBytes.writeByte(tanabateData1);
                    }
                    break;
                default:
                    break;
            }
        }
        catch (e:*) {

        }
    }
}
}