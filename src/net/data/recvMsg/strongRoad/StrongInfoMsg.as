package net.data.recvMsg.strongRoad {
import utils.LunaUtil;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.strongRoad.ChestsStruct;
import net.data.structs.strongRoad.StrongInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class StrongInfoMsg extends BaseMsg {
    public var type:uint = 0;
    public var infoStruct:StrongInfoStruct;
    public var chests:ChestsStruct; //当前完成次数 总次数

    public var strongDays:uint;//天数
    public var strongTrackInfo:Array;
    public var alertBits:Vector.<Boolean> = new Vector.<Boolean>(8);

    public var box:Array = [];//更新单个宝箱

    public function StrongInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        if (type == 0x01) {//0x01:变强之魂信息改变
            readInfo(bytes);
        } else if (type == 0x02) {//0x02:变强之路信息

            readStrongRoadInfo(bytes);
        } else if (type == 0x03) {//0x03:请求及打开变强秘宝

            readChestsInfo(bytes);
        } else if (type == 0x04) {//0x04:每天一次变强之吼

            readSoul(bytes);
        } else if (type == 0x05) {//0x05:25/50/75/100龙魂客户端闪烁

        }
        else if (type == 0x06) {//0x06:弹出标志

            var value:uint = bytes.readUnsignedByte();
            for (var i:int = 0; i < 8; i++) {
                alertBits[i] = LunaUtil.readBit(value, i);
            }
        }

        return true;
    }

    private function readStrongRoadInfo(bytes:ByteArray):void {
        strongDays = BytesUtil.readByte1(bytes);
        strongTrackInfo = [];
        for (var i:uint = 0; i < 5; i++) {
            var arr:Array = [];
            for (var j:uint = 0; j < strongDays; j++) {
                arr.push(bytes.readUnsignedInt());
            }
            strongTrackInfo.push(arr);
        }

    }

    private function readSoul(bytes:ByteArray):void {
        infoStruct = new StrongInfoStruct();
        infoStruct.strongId = BytesUtil.readByte1(bytes);
        if (infoStruct.strongId == 10)
            infoStruct.strongId = 5;
        else
            infoStruct.strongId -= 4;

        infoStruct.currValue = BytesUtil.readByte1(bytes);
        infoStruct.totalValue = 100;
    }

    private function readInfo(bytes:ByteArray):void {
        infoStruct = new StrongInfoStruct();
        infoStruct.strongId = BytesUtil.readByte1(bytes);
        if (infoStruct.strongId == 10)
            infoStruct.strongId = 5;
        else
            infoStruct.strongId -= 4;
        infoStruct.currValue = BytesUtil.readByte1(bytes);
        infoStruct.totalValue = 100;
        var taskNum:uint = BytesUtil.readByte1(bytes);
        for (var i:uint = 0; i < taskNum; i++) {
            infoStruct.taskInfo.push([BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes)]);
        }

        for (var i:uint = 0; i < 8; i++) {
            infoStruct.boxInfo.push([BytesUtil.readByte1(bytes), bytes.readUnsignedInt()]);
        }
    }

    private function readChestsInfo(bytes:ByteArray):void {
        var id:uint = BytesUtil.readByte1(bytes);
        var state:uint = bytes.readUnsignedInt();

        box = [];
        box.push(id);
        box.push(state);
    }
}
}
