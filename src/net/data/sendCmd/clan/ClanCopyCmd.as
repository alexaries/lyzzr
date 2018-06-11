package net.data.sendCmd.clan {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class ClanCopyCmd extends BaseCmd {
    public var type:int;
    public var command:int;
    public var val:int;

    public var playerId:BigInteger;
    public var oldSpotId:int;
    public var oldPosition:int;
    public var newSpotId:int;
    public var newPosition:int;

    public var skillType:int;

    public function ClanCopyCmd() {
        this.msgType = MsgConst.CLAN_COPY;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0x01:
                {
                    bodyBytes.writeByte(command);
                    switch (command) {
                        case 0:
                            break;
                        case 1:
                            bodyBytes.writeByte(val);
                            break;
                    }
                    break;
                }
                case 0x03:
                    bodyBytes.writeByte(command);
                    switch (command) {
                        case 0x02:
                            BytesUtil.writeUint64(bodyBytes, playerId);
                            bodyBytes.writeByte(oldSpotId);
                            bodyBytes.writeByte(oldPosition);
                            bodyBytes.writeByte(newSpotId);
                            bodyBytes.writeByte(newPosition);
                            break;
                        case 0x03:
                            bodyBytes.writeByte(skillType);
                            break;
                    }
                    break;
            }

        }
        catch (e:*) {

        }
    }
}
}