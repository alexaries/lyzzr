package net.data.recvMsg.carrer {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CarrerOperMsg extends BaseMsg {
    public var operation:uint;
    public var result:uint;
    /**
     * 投注时段<br>
     * 0 - 投注阶段1 入围赛<br>
     * 1 - 投注阶段2 32强<br>
     * 2 - 投注阶段3 8强1<br>
     * 3 - 投注阶段4 8强2<br>
     * 4 - 投注阶段5 4强<br>
     * 5 - 投注阶段6 2强<br>
     * 6 - 投注阶段7 1强<br>
     * */
    public var state:uint;
    public var position:uint;
    public var group:uint;
    public var fightID:BigInteger;

    public function CarrerOperMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        operation = BytesUtil.readByte1(bytes);
        switch (operation) {
            case 0:
                result = BytesUtil.readByte1(bytes);
                result = result & 0x0f;
                break;
            case 1:
            case 3:
            case 4:
                result = BytesUtil.readByte1(bytes);
                break;
            case 2:
                result = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                if (state < 2) {
                    var idBytes:ByteArray = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    fightID = BytesUtil.readUint64(idBytes);
                } else {
                    position = BytesUtil.readByte2(bytes);
                    group = BytesUtil.readByte1(bytes);
                }
                break;
            default:
                break;
        }

        return true;
    }
}
}
