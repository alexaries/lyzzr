/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-3-25
 * Time: 下午3:45
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.chaosFight {
import net.data.BaseCmd;
import net.events.MsgConst;

public class ChaosFightCmd extends BaseCmd {
    public var type:uint;
    public var opt:uint;

    public function ChaosFightCmd() {
        super();
        msgType = MsgConst.ACTIVE_INFO;
    }

    override protected function createBody():void {
        try {
//            bodyBytes.writeByte(0x30);
            bodyBytes.writeByte(type);
            switch (type) {
                case 0x04:
                    bodyBytes.writeByte(opt);
                    break;
                case 0x09:
                    bodyBytes.writeUnsignedInt(opt);
                    break;
                default:
                    break;
            }
        } catch (err:Error) {
        }
    }
}
}
