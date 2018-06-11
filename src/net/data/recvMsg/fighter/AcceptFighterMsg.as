package net.data.recvMsg.fighter {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x28 武将加入
 */
public class AcceptFighterMsg extends BaseMsg {
    public var id:uint = 0;
    public var name:String = "";
    /**
     * 职业
     * 0-猛将1
     * 1-猛将2
     * 2-刺客1
     * 3-刺客2
     * 4-术士1
     * 5-术士2
     */
    public var clss:uint = 0;
    public var sex:uint = 0;
    public var portrait:uint = 0;
    public var level:uint = 0;
    public var exp:Number = 0;
    public var potential:Number = 0;
    public var wit:Number = 0;
    public var skillid:uint;
    public var cittaid:uint;
    public var soul:uint;
    public var maxSoul:uint;

    public function AcceptFighterMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            id = BytesUtil.readByte2(bytes);
            potential = bytes.readFloat();
            wit = bytes.readFloat();
            level = BytesUtil.readByte1(bytes);
            exp = BytesUtil.readBytes8(bytes);
            skillid = BytesUtil.readByte2(bytes);
            cittaid = BytesUtil.readByte2(bytes);
            soul = BytesUtil.readByte2(bytes);
            maxSoul = BytesUtil.readByte2(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}