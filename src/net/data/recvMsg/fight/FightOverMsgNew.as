package net.data.recvMsg.fight {

import utils.ByteArray;

import net.data.structs.fight.FightMsgParser;
import net.utils.BytesUtil;

/**
 * (S->C) 0x27  战斗结束
 */
public class FightOverMsgNew extends FightOverMsg {


    public var flag:uint;
    static private var tempByteArray2:ByteArray;
    static private var isFullPack2:Boolean;

    public function FightOverMsgNew() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {


//				var t:int = BytesUtil.readByte1(bytes);
//				if(t != 0x23)
//					return false;


            var tempArr:ByteArray = tempByteArray2;
            flag = BytesUtil.readByte1(bytes)
            if (!flag && !tempArr) {
                readFullBag(bytes);
                isFullPack2 = true;
            } else if (!flag && tempArr) {
                var newArr:ByteArray = BytesUtil.creatByteArray();
                tempArr.readBytes(newArr, 0, tempArr.bytesAvailable)
                var len:int = tempArr.length;
                bytes.readBytes(newArr, len, bytes.bytesAvailable);

                readFullBag(newArr);
                isFullPack2 = true;
                tempByteArray2 = null;
            } else {
                if (!tempArr) {
                    tempArr = BytesUtil.creatByteArray();
                }
                bytes.readBytes(tempArr, tempArr.length, bytes.bytesAvailable)
                tempByteArray2 = tempArr;
                isFullPack2 = false;
            }

            //				readFullBag(bytes);

        return true;
    }


    private function readFullBag(bytes:ByteArray):void {

        var i:Number;
        var goodsID:Number;
        var num:Number;

        result = BytesUtil.readByte1(bytes);
        reportType = BytesUtil.readByte1(bytes);
        if (reportType == 0 || reportType == 2) {
            reportId = bytes.readUnsignedInt();
        }
        else if (reportType == 1) {
            expGot = bytes.readUnsignedInt();
            fighterCount = BytesUtil.readByte1(bytes);
            for (i = 0; i < fighterCount; i++) {
                var obj:Object = {};
                obj.pos = BytesUtil.readByte1(bytes);
                obj.oldExp = bytes.readUnsignedInt();
                fighters.push(obj);
            }
            itemCount = BytesUtil.readByte1(bytes);
            for (i = 0; i < itemCount; i++) {
                goodsID = BytesUtil.readByte2(bytes);
                num = BytesUtil.readByte2(bytes);
                itemData.push(goodsID);
                itemNum.push(num);
            }

            msgStruct = FightMsgParser.getInstace().parseFightMsg(bytes);
            if (!flag)
                exp = BytesUtil.readBytes8(bytes);
        }
    }


}
}