package net.data.recvMsg.map {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.map.NpcInfoStruct;
import net.utils.BytesUtil;

/**
 * 城内布局返回信息：
 * 信息ID：0x52
 * */
public class TransportMapMsg extends BaseMsg {
    private var npcData:Array;

    public function TransportMapMsg() {
    }

    /**
     * @copy com.net.data.BaseCmd#byteArrayToMsg()
     */
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            if (npcData) npcData = null;
            npcData = [];
            var cityId:int = BytesUtil.readByte1(bytes);
            var npcNums:int = BytesUtil.readByte1(bytes);
            var npcStruct:NpcInfoStruct;
            for (var i:uint = 0; i < npcNums; i++) {
                npcStruct = new NpcInfoStruct();
                npcStruct.npcId = bytes.readUnsignedInt();
                npcStruct.locId = BytesUtil.readByte2(bytes);
                npcStruct.type = BytesUtil.readByte1(bytes);
                npcStruct.flag = BytesUtil.readByte1(bytes);
                npcData.push(npcStruct);
            }
        }
        catch (e:*) {

        }
        return true;
    }

    public function getNpcData():Array {
        return npcData;
    }
}
}