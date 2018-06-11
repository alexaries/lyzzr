package net.data.recvMsg.carrer {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;
import net.utils.MsgCenter;

/**
 * @author ryan
 */
public class CarrerAllMsg extends BaseMsg {
    public var flag:uint;

    public function CarrerAllMsg() {
        super();
    }

    public function getMsg(bytes:ByteArray):BaseMsg {
        flag = BytesUtil.readByte1(bytes);
        var msg:BaseMsg;
        switch (flag) {
            case 0:
                msg = MsgCenter.getMsg(CarrerOperMsg, bytes) as CarrerOperMsg;
                break;
            case 1:
                msg = MsgCenter.getMsg(CarrerMsg, bytes) as CarrerMsg;
                break;
            case 2:
                msg = MsgCenter.getMsg(CarrerTopListMsg, bytes) as CarrerTopListMsg;
                break;
            case 5:
                msg = MsgCenter.getMsg(CarrerIdMsg, bytes) as CarrerIdMsg;
                break;
            case 6:
                msg = MsgCenter.getMsg(CarrerRefreshMsg, bytes) as CarrerRefreshMsg;
                break;
        }


        return msg;
    }

}
}
