

package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 * yangjx(杨建新) 12-29 14:01:29
 27 36
 yangjx(杨建新) 12-29 14:01:44
 战斗演示好了 调用这个协议就OK了
 */
public class DemoCmd extends BaseCmd {


    public function DemoCmd() {
        this.msgType = 0x27;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x37);
        } catch (e:*) {
        }
    }
}
}
