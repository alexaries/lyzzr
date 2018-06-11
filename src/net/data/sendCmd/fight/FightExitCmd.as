package net.data.sendCmd.fight {
import net.data.BaseCmd;
import net.events.MsgConst;

public class FightExitCmd extends BaseCmd {
    //private var _pCtrl : uint;
    public function FightExitCmd() {
        this.msgType = MsgConst.FIGHT_EXIT;
    }

    override protected function createBody():void {
        try {
            //this.bodyBytes.writeShort(_pCtrl);
        }
        catch (e:*) {

        }
    }

//		public function set pCtrl(pCtrl : uint) : void {
//			_pCtrl = pCtrl;
//		}
}
}