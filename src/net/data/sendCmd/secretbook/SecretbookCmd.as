package net.data.sendCmd.secretbook {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xB0 请求商城物品列表
 */
public class SecretbookCmd extends BaseCmd {
    public var type:uint = 0;

    public function SecretbookCmd() {
        this.msgType = MsgConst.SECRETBOOK_INFO;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
        }
        catch (e:*) {

        }
    }
}
}