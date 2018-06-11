package net.data.recvMsg.fight {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.fight.FightMsgParser;
import net.data.structs.fight.MsgStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x61 战斗结束
 */
public class FightOverMsg extends BaseMsg {
//		[Embed(source="E:/s3/dev2/ao3s/Main/assets_zh_CN/fightldk/dat/ldk.dat",mimeType="application/octet-stream")]
//		public var bytesClass:Class;
    /**
     * 战斗结果
     * 1 - 胜利
     * 0 - 失败
     */
    public var result:uint = 0;
    /**
     * 战报模式
     * 0 - 战报ID
     * 1 - 战报数据包
     */
    public var reportType:uint = 0;
    public var reportId:uint = 0;

    public var expGot:uint = 0;
    public var fighterCount:uint = 0;
    public var fighters:Array = [];
    public var itemCount:uint = 0;
    public var itemData:Array = [];
    public var itemNum:Array = [];
    public var msgStruct:MsgStruct;
    public var exp:Number = 0;

    public function FightOverMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
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
            //存本地dat
//					var ldkBytes:ByteArray = BytesUtil.creatByteArray();
//					ldkBytes.writeBytes(bytes, bytes.position);
//					new FileReference().save(ldkBytes, "ldk.dat");
            //播本地dat
//					bytes = new bytesClass();
//					bytes.endian = Endian.LITTLE_ENDIAN;
            //
            msgStruct = FightMsgParser.getInstace().parseFightMsg(bytes);
            exp = BytesUtil.readBytes8(bytes);
        }

        return true;
    }


}
}