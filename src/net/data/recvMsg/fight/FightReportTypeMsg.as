package net.data.recvMsg.fight {

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.fight.FightMsgParser;
import net.data.structs.fight.MsgStruct;
import net.utils.BytesUtil;

/**
 * 消息id: 0x6C
 * 解析战斗消息数据,并存放到msgStruct,可通过 getFightMsgVO来获取数据
 */
public class FightReportTypeMsg extends BaseMsg {
    static public var tempByteArray3:ByteArray;
    static public var isFullPack3:Boolean;
    public var reportId:uint = 0;
    public var type:uint = 0;
    /**
     * 战斗消息包
     */
    public var msg:MsgStruct;

    public function FightReportTypeMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
//				type = bytes.readByte();
//				reportId = bytes.readUnsignedInt();
//				msg = FightMsgParser.getInstace().parseFightMsg(bytes);


            //------------------新战斗包---------------//
            var tempArr:ByteArray = tempByteArray3;
            var flag:uint = BytesUtil.readByte1(bytes)
            if (!flag && !tempArr) {
                type = bytes.readByte();
                reportId = bytes.readUnsignedInt();
                msg = FightMsgParser.getInstace().parseFightMsg(bytes);
                isFullPack3 = true;
            } else if (!flag && tempArr) {

                var newArr:ByteArray = BytesUtil.creatByteArray();
                tempArr.readBytes(newArr, 0, tempArr.bytesAvailable)
                var len:int = newArr.length
                bytes.readBytes(newArr, len, bytes.bytesAvailable);

                type = bytes.readByte();
                reportId = newArr.readUnsignedInt();
                msg = FightMsgParser.getInstace().parseFightMsg(newArr);
                isFullPack3 = true;
                tempByteArray3 = null;
            } else {
                if (!tempArr) {
                    tempArr = BytesUtil.creatByteArray();
                }
                bytes.readBytes(tempArr, tempArr.length, bytes.bytesAvailable)
                tempByteArray3 = tempArr;
                isFullPack3 = false;
            }

            //---------------------------------//
        }
        catch (e:*) {

        }
        return true;
    }
}
}