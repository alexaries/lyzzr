package net.data.sendCmd.ctwar {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 消息协议 0x62
 * @author r.c
 *
 */
public class CTWarJoinCmd extends BaseCmd {
    /**
     * 参加国战的CMD
     * 消息协议 0x62
     * */
    public function CTWarJoinCmd() {
        super();
        this.msgType = MsgConst.CAMPS_WAR_JOIN;
    }

    /**
     * 玩家参加国战或者退出国战
     *   0 - 参加国战
     *   1 - 退出国战
     * */
    private var _flag:int;

    public function get flag():int {
        return _flag;
    }

    public function set flag(value:int):void {
        _flag = value;
    }


    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_flag);
        } catch (e:*) {

        }
    }
}
}