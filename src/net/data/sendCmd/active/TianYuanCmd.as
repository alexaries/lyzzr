/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-3-6
 * Time: 下午2:25
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.active {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TianYuanCmd extends BaseCmd {
    public var type:uint;
    public var opt:uint;

    public function TianYuanCmd() {
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(0x31);
        bodyBytes.writeByte(type);
        switch (type) {
            case 0x00:
                break;
            case 0x01:
                break;
            case 0x13:
                bodyBytes.writeByte(opt);
                break;
            case 0x03:
                bodyBytes.writeByte(opt);
                break;
            case 0x04:
                bodyBytes.writeByte(opt);
                break;
            case 0x05:
                break;
            case 0x06:
                break;
            case 0x07:
                break;
            case 0x11:
                break;
            case 0x12:
                break;
            case 0x15:
                bodyBytes.writeByte(opt);
                break;
        }
    }
}
}
