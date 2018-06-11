package net.data.sendCmd.endwar {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class EndWarCmd extends BaseCmd {

    public var type:int;
    /**
     * 攻击类型
     */
    public var playerId:BigInteger = BigInteger.nbv(0);
    public var place:int;
    public var id:int;

    public function EndWarCmd() {
        super();
        msgType = MsgConst.ENDWAR;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0:
                    //trace("0-基本状态信息");
                    break;
                case 1:
                    //trace("1 - BOSS");
                    break;
                case 2:
                    BytesUtil.writeUint64(bodyBytes, playerId);
                    //trace("2 - 抢占资源");
                    break;
                case 3:
                    //trace("3 - 请求赏金任务目标状态");
                    break;
                case 4:

                    //trace("4 - 资源矿",locID);
                    break;
                case 5:
                    BytesUtil.writeUint64(bodyBytes, playerId);
                    break;
                case 6:
                    bodyBytes.writeByte(place);
                    BytesUtil.writeUint64(bodyBytes, playerId);
                    break;

                case 8:
                    bodyBytes.writeByte(place);
                    break;
                case 9:
                    bodyBytes.writeByte(place);
                    BytesUtil.writeUint64(bodyBytes, playerId);
                    break;
                case 12:
                case 13:
                    bodyBytes.writeByte(id);
                    break;
                default:
            }
        }
        catch (e:Error) {

        }
    }
}
}
