package net.data.sendCmd.daily {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 日常 数据请求
 * */
public class DailyDataCmd extends BaseCmd {
    public function DailyDataCmd() {
        msgType = MsgConst.DAILY;
    }

    override protected function createBody():void {
        try {

        } catch (e:*) {

        }
    }

}
}