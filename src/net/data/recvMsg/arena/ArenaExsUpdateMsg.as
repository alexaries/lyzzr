package net.data.recvMsg.arena {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.arena.ArenaBuff;
import net.data.structs.arena.AthlTypeInfo;
import net.data.structs.arena.FightInfoStruct2;
import net.utils.BytesUtil;
public class ArenaExsUpdateMsg extends BaseMsg {
    /**
     * 0：历练信息
     * 1：对手列表（换一批）
     * 2：领奖
     */
    public var type:uint = 0;
    /**
     * type为0 和 1
     * byte	progress	进度
     * byte	prizeState	领奖状态 0:不能领取；1:可以领取；2:已经领取
     * FighterInfo 6	list	对手列表
     */
    public var progress:uint = 0;
    public var prizeState:uint = 0;
    public var athRivalSts:Array = [];
    public function ArenaExsUpdateMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        athRivalSts = [];
        type = BytesUtil.readByte1(bytes);
        if (type == 2) {
            prizeState = BytesUtil.readByte1(bytes);
        }
        else if (type == 1 || type == 0) {
            progress = BytesUtil.readByte1(bytes);
            prizeState = BytesUtil.readByte1(bytes);
            for (var j:uint = 0; j < 6; j++) {
                var fightInfo:FightInfoStruct2 = new FightInfoStruct2();
                fightInfo.userName = BytesUtil.readUserName(bytes);
                fightInfo.level = BytesUtil.readByte1(bytes);
                fightInfo.career = BytesUtil.readByte1(bytes);
                fightInfo.sex = BytesUtil.readByte1(bytes);
                fightInfo.color = BytesUtil.readByte1(bytes);
                fightInfo.country = BytesUtil.readByte1(bytes);
                fightInfo.canFight = BytesUtil.readByte1(bytes);
                athRivalSts.push(fightInfo);
            }
        }

        return true;
    }
}
}
