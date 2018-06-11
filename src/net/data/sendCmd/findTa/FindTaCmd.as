/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-7-28
 * Time: 上午11:03
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.findTa {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class FindTaCmd extends BaseCmd {
    public var type:uint;
    public var args:Array;

    public function FindTaCmd() {
        this.msgType = MsgConst.ANNIVERSARY;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x12);
            this.bodyBytes.writeByte(type);
            switch (type) {
                case 0x01:
                    break;
                case 0x02:
                    this.bodyBytes.writeByte(args[0]);
                    break;
                case 0x03:
                    this.bodyBytes.writeByte(args[0]);
                    break;
                case 0x04:
                    BytesUtil.writeUint64(bodyBytes, args[0]);
                    break;
                case 0x11:
                    BytesUtil.writeUint64(bodyBytes, args[0]);
                    bodyBytes.writeByte(args[1]);
                    bodyBytes.writeUnsignedInt(args[2]);
                    bodyBytes.writeUTF(args[3]);
                    break;
                case 0x12:
                    this.bodyBytes.writeUTF(args[0]);
                    break;
                case 0x13:
                    break;
            }
        }
        catch (e:*) {

        }
    }
}
}
