package net.data.recvMsg.flaunt {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.fight.FightMsgParser;
import net.data.structs.fight.MsgStruct;

/**
 * 炫耀战报消息
 */
public class FlauntFightMsg extends BaseMsg {
    /**
     * 战报id
     */
    private var _battleReportId:uint = 0;
    /**
     * 战报信息结构
     */
    public var msgStruct:MsgStruct;

    public function FlauntFightMsg() {
        super();
    }

    public function get battleReportId():uint {
        return _battleReportId;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _battleReportId = bytes.readUnsignedInt();
            msgStruct = FightMsgParser.getInstace().parseFightMsg(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}