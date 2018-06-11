package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.practice.PracticeStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PageChangeMsg extends BaseMsg {
    public var pageIndex:uint = 0;
    public var infoList:Array;

    public function PageChangeMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            pageIndex = BytesUtil.readByte1(bytes);
            var num:uint = BytesUtil.readByte1(bytes);
            var practiceInfo:PracticeStruct;
            infoList = [];
            for (var i:uint = 0; i < num; i++) {
                practiceInfo = new PracticeStruct();
                practiceInfo.index = BytesUtil.readByte1(bytes);
                practiceInfo.userName = BytesUtil.readUserName(bytes);
                practiceInfo.country = BytesUtil.readByte1(bytes);
                practiceInfo.career = BytesUtil.readByte1(bytes);
                practiceInfo.sex = BytesUtil.readByte1(bytes);
                practiceInfo.level = BytesUtil.readByte1(bytes);
                practiceInfo.protectType = BytesUtil.readByte1(bytes);
                practiceInfo.time = bytes.readUnsignedInt();
                infoList[practiceInfo.index] = practiceInfo;
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}
