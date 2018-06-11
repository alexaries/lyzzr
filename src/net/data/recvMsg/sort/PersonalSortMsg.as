package net.data.recvMsg.sort {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.sort.PersonalSortStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xE9 返回个人排行数据
 */
public class PersonalSortMsg extends BaseMsg {
    public var personalSortStruct:PersonalSortStruct;

    public function PersonalSortMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            personalSortStruct = new PersonalSortStruct();
            personalSortStruct.id = bytes.readUnsignedInt();
            personalSortStruct.levelW = BytesUtil.readByte2(bytes);
            personalSortStruct.levelC = BytesUtil.readByte2(bytes);
            personalSortStruct.arenaW = BytesUtil.readByte2(bytes);
            personalSortStruct.arenaC = BytesUtil.readByte2(bytes);
            personalSortStruct.fightScoreW = BytesUtil.readByte2(bytes);
            personalSortStruct.fightScoreC = BytesUtil.readByte2(bytes);
            personalSortStruct.clanW = BytesUtil.readByte2(bytes);
            personalSortStruct.clanC = BytesUtil.readByte2(bytes);
            personalSortStruct.battle = BytesUtil.readByte2(bytes);

//				personalSortStruct.battle = BytesUtil.readByte2(bytes);
//				personalSortStruct.battle = BytesUtil.readByte2(bytes);
//				personalSortStruct.battle = BytesUtil.readByte2(bytes);
        }
        catch (e:*) {

        }
        return true;
    }
}
}