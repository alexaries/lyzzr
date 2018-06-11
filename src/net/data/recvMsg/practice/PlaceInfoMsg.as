package net.data.recvMsg.practice {
import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.practice.JebelInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PlaceInfoMsg extends BaseMsg {
    public var infoList:Array;

    public function PlaceInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var infoNum:uint = BytesUtil.readByte1(bytes);
            var jebelInfo:JebelInfoStruct;
            infoList = [];
            for (var i:uint = 0; i < infoNum; i++) {
                jebelInfo = new JebelInfoStruct();
                jebelInfo.type = BytesUtil.readByte1(bytes);
                jebelInfo.speed = BytesUtil.readByte2(bytes);
                jebelInfo.cost = BytesUtil.readByte2(bytes);
                jebelInfo.owner = BytesUtil.readUserName(bytes);
                jebelInfo.totalSpace = BytesUtil.readByte1(bytes);
                jebelInfo.occupySpace = BytesUtil.readByte1(bytes);
                jebelInfo.protector = BytesUtil.readUserName(bytes);
                jebelInfo.protectLevel = BytesUtil.readByte1(bytes);
                jebelInfo.protectorCareer = BytesUtil.readByte1(bytes);
                jebelInfo.protectGender = BytesUtil.readByte1(bytes);
                jebelInfo.enemyCount = BytesUtil.readByte2(bytes);
                jebelInfo.winCount = BytesUtil.readByte2(bytes);
                infoList.push(jebelInfo);
            }
        } catch (e:*) {
        }
        if (!StaticConfig.isMerge && infoNum == 7) {
            //本服是7-13，如果是没合服的0-5就是本服的，为了索引可以直接引用，故把0-5 copy 7-13
            for (i = 7; i < 13; i++) {
                infoList[i] = infoList[i - 7];
            }
        }
        return true;
    }
}
}
