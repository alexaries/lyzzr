/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-6-10
 * Time: 下午5:10
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.fightBoss {
import net.data.BaseCmd;
import net.events.MsgConst;

public class FightBossCmd extends BaseCmd {
    public var type:uint;
    public var state:uint;

    public function FightBossCmd() {
        this.msgType = MsgConst.FIGHT_BOSS;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            switch (type) {
                case 0x05:
                    this.bodyBytes.writeByte(state);
                    break;
            }
        }
        catch (e:*) {

        }
    }
}
}
