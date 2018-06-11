package net.data.recvMsg.camps {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.ctwar.CTRankStruct;
import net.utils.BytesUtil;

/**
 * 消息协议 0x64  国战结果
 * @author RyanCao
 *
 */
public class CampsResultMsg extends BaseMsg {
    public function CampsResultMsg() {
        super();
    }

    public var locationId:int;
    public var elyosPoint:int;
    public var evilPoint:int;
    public var owner:int;
    public var myRank:int;
    public var cbData:Array;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        locationId = BytesUtil.readByte2(bytes);

        elyosPoint = bytes.readUnsignedInt();
        evilPoint = bytes.readUnsignedInt();
//				elyosPoint = BytesUtil.readByte2(bytes);
//				evilPoint = BytesUtil.readByte2(bytes);

        owner = BytesUtil.readByte1(bytes);
        myRank = BytesUtil.readByte2(bytes);
        cbData = [];

        var len:int = 5;
        for (var i:int = 0; i < len; i++) {
            var struct:CTRankStruct = new CTRankStruct();
            struct.countryID = BytesUtil.readByte1(bytes);
            struct.name = BytesUtil.readUserName(bytes);
            struct.level = BytesUtil.readByte1(bytes);
            struct.kill = BytesUtil.readByte1(bytes);
            struct.streak = BytesUtil.readByte1(bytes);
            struct.clanname = BytesUtil.readUserName(bytes);
            struct.achieve = BytesUtil.readByte2(bytes);
            struct.rank = i + 1;
            cbData.push(struct);
        }

        return true;
    }
}
}