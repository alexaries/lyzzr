package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息协议 0x23 请求散仙信息
 */
public class UserHerosInfoCmd extends BaseCmd {
    public function UserHerosInfoCmd() {
        super();
        this.msgType = MsgConst.HERO_INFO;
    }

    private var _herosId:Array;


    public function set herosId(value:Array):void {
        _herosId = value;
    }

    override protected function createBody():void {
        try {
            var len:int = _herosId.length;
            bodyBytes.writeByte(len);
            for (var i:int = 0; i < len; i++) {
                bodyBytes.writeUnsignedInt(_herosId[i]);
            }
        } catch (e:*) {

        }
    }
}
}