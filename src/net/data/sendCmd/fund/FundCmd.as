/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-1-13
 * Time: 上午10:30
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.fund {
import net.data.BaseCmd;
import net.events.MsgConst;

public class FundCmd extends BaseCmd {
    public var type:uint;
    public var opt:uint;

    public function FundCmd() {
        super();
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(0x28);
            bodyBytes.writeByte(type);
            switch (type) {
                case 0x00:
                    bodyBytes.writeByte(opt);
                    break;
                case 0x01:
                    bodyBytes.writeUnsignedInt(opt);
                    break;
                case 0x02:
                    bodyBytes.writeByte(opt);
                    break;
                case 0x03:
                    bodyBytes.writeByte(opt);
                    break;
            }
        } catch (e:*) {

        }
    }
}
}