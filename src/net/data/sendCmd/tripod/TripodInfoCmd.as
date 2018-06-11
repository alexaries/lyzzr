package net.data.sendCmd.tripod {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S 0x39 九疑鼎信息)
 */
public class TripodInfoCmd extends BaseCmd {
    /**
     * uint8	type	0:请求详情，1:升级，2:升阶
     * type=1
     * uint8	size	消耗的法宝数量
     * uint32*	idvec	消耗的法宝id数组
     */
    public var type:uint = 0;
    public var itemArr:Array;
    public var num:int;

    public function TripodInfoCmd() {
        this.msgType = MsgConst.TRIPOD_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            if (type == 1) {
                num = itemArr.length;
                bodyBytes.writeByte(num);
                for (var i:uint = 0; i < num; i++) {
                    BytesUtil.writeBigInt(itemArr[i].id, bodyBytes);
                    this.bodyBytes.writeByte(itemArr[i].bind);
                    this.bodyBytes.writeShort(itemArr[i].num);
                }
            }
        }
        catch (e:*) {

        }
    }
}
}
