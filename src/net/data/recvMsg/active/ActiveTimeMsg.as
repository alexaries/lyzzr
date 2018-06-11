package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class ActiveTimeMsg extends BaseMsg {
    public var type:uint = 0;
    public var currScores:uint;
    public var goodsId:uint;
    public var goodsN:uint;
    public var goodsS:uint;
    public var sign:uint;
    public var signCnt:int;
    public var monthInfo:Array;

    public function ActiveTimeMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 0:
                currScores = bytes.readUnsignedInt();
                sign = bytes.readUnsignedShort();
                signCnt = bytes.readUnsignedByte();
                break;
            case 1:
                goodsId = bytes.readUnsignedShort();
                goodsN = bytes.readUnsignedByte();
                goodsS = bytes.readUnsignedShort();
                break;
            case 2:
                currScores = bytes.readUnsignedInt();
                goodsId = bytes.readUnsignedShort();
                goodsN = bytes.readUnsignedByte();
                goodsS = bytes.readUnsignedShort();
                break;
            case 3:
                currScores = bytes.readUnsignedInt();
                goodsId = bytes.readUnsignedShort();
                goodsN = bytes.readUnsignedByte();
                goodsS = bytes.readUnsignedShort();
                var n:uint = bytes.readUnsignedByte();
                monthInfo = [];//[]
                var j:int;
                for (var i:int = 0; i < n; i++) {
                    monthInfo[i] = [];
                    monthInfo[i][0] = bytes.readUnsignedShort();
                    monthInfo[i][1] = bytes.readUnsignedByte();
                    var cnt:uint = bytes.readUnsignedByte();
                    for (j = 0; j < cnt; j++) {
                        monthInfo[i].push([bytes.readUnsignedShort(), bytes.readUnsignedByte()]);//[id,cnt]
                    }
                }
                break;
        }

        return true;
    }
}
}
