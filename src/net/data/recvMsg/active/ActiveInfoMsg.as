package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.active.ActiveInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class ActiveInfoMsg extends BaseMsg {
    public var type:uint = 0;
    public var selectedItem:uint;
    public var awardGot:Array;
    public var awardInfo:Array;
    public var activeInfoStruct:ActiveInfoStruct;
    public var remainTime:uint = 0;
    public var wday:uint;

    public function ActiveInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        if ((type & 0x01) != 0) readAwardInfo(bytes);
//				if ((type & 0x02) != 0) readActiveInfo(bytes);
        if ((type & 0x04) != 0) remainTime = bytes.readUnsignedInt();

        return true;
    }

    private function readAwardInfo(bytes:ByteArray):void {
        awardInfo = [];
        awardGot = [];
        var i:uint;
        for (i = 0; i < 7; i++) {
            awardGot.push([BytesUtil.readByte1(bytes), BytesUtil.readByte2(bytes)]);
        }
        wday = BytesUtil.readByte1(bytes);
        var awardNum:uint = BytesUtil.readByte1(bytes);
        for (i = 0; i < awardNum; i++) {
            awardInfo.push([BytesUtil.readByte1(bytes), bytes.readUnsignedInt(), 1]);
        }
    }

    private function readActiveInfo(bytes:ByteArray):void {
        activeInfoStruct = new ActiveInfoStruct();
        activeInfoStruct.currActiveValue = BytesUtil.readByte1(bytes);
        activeInfoStruct.totalActiveValue = BytesUtil.readByte1(bytes);
        activeInfoStruct.currScores = bytes.readUnsignedInt();
        activeInfoStruct.sign = bytes.readUnsignedByte();
        activeInfoStruct.goodsId = bytes.readUnsignedShort();
        activeInfoStruct.goodsN = bytes.readUnsignedByte();
        activeInfoStruct.goodsS = bytes.readUnsignedShort();
        var taskNum:uint = BytesUtil.readByte1(bytes);
        for (var i:uint = 0; i < taskNum; i++) {
            activeInfoStruct.taskInfo.push([BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes)]);
        }
        activeInfoStruct.awardState = BytesUtil.readByte2(bytes);
    }
}
}
