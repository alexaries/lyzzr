/**
 * Created by huangcb on 2017/8/30.
 */
package net.data.sendCmd.heropanel {
import net.data.BaseCmd;
import net.events.MsgConst;

public class RideCmd extends BaseCmd {
    /**
     * 请求坐骑信息
     */
    public var flag:int;
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------

    public function RideCmd() {
        super();
        msgType = MsgConst.RIDE_INFO ;
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override protected function createBody() : void
    {
        try
        {
            this.bodyBytes.writeByte(flag);
        }
        catch(e:*)
        {

        }
    }
}
}