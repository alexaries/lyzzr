package net.data.sendCmd.disaster {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 天劫数据请求
 */
public class DisasterDataCmd extends BaseCmd {
    public var type:uint;
    public var cmd:uint;
    public var id:uint;

    public function DisasterDataCmd() {
        msgType = MsgConst.DISASTER;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);

            if (type > 0) {
                bodyBytes.writeByte(cmd);
                bodyBytes.writeByte(id);

            }
        } catch (e:*) {
        }
    }
}
}
