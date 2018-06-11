/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-2-25
 * Time: 上午10:41
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.chaosArea {
import net.data.BaseCmd;
import net.events.MsgConst;

public class ChaosAreaCmd extends BaseCmd {
    public var type:uint;
    public var opt:uint;
    public var list:Vector.<String>;

    public function ChaosAreaCmd() {
        super();
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        try {
            var i:uint;
            var len:uint;
            bodyBytes.writeByte(0x30);
            bodyBytes.writeByte(type);
            switch (type) {
                case 0x00:
                    break;
                case 0x01:
                    len = list.length;
                    bodyBytes.writeShort(len);
                    for (i = 0; i < len; i++) {
                        bodyBytes.writeUTF(list[i]);
                    }
                    break;
                case 0x02:
                    break;
                case 0x03:
                    bodyBytes.writeByte(opt);
                    break;
                case 0x04:
                    bodyBytes.writeByte(opt);
                    break;
            }
        } catch (e:*) {

        }
    }
}
}
