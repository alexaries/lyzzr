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
public class FightActionMsg extends BaseMsg {
    static private var tempByteArray:ByteArray;
    static private var isFullPack:Boolean;
    private var _battleReportId:uint = 0;
    /**
     * 战斗消息包
     */
    private var _msgStruct:MsgStruct;

    public function FightActionMsg() {
        super();
    }

    public function get battleReportId():uint {
        return _battleReportId;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        //try
        //{
        var tempArr:ByteArray = tempByteArray;
        var flag:uint = BytesUtil.readByte1(bytes)
        if (!flag && !tempArr) {
            _battleReportId = bytes.readUnsignedInt();
            _msgStruct = FightMsgParser.getInstace().parseFightMsg(bytes);
            isFullPack = true;
        } else if (!flag && tempArr) {

            var newArr:ByteArray = BytesUtil.creatByteArray();
            tempArr.readBytes(newArr, 0, tempArr.bytesAvailable)
            var len:int = newArr.length
            bytes.readBytes(newArr, len, bytes.bytesAvailable);

            _battleReportId = newArr.readUnsignedInt();
            _msgStruct = FightMsgParser.getInstace().parseFightMsg(newArr);
            isFullPack = true;
            tempByteArray = null;
        } else {
            if (!tempArr) {
                tempArr = BytesUtil.creatByteArray();
            }
            bytes.readBytes(tempArr, tempArr.length, bytes.bytesAvailable)
            tempByteArray = tempArr;
            isFullPack = false;
        }
        trace(0);
        //	}
        //catch(e:*)
        //{

        //}
        return true;
    }

    public function getFightMsgVO():MsgStruct {
        return _msgStruct;
    }
}
}