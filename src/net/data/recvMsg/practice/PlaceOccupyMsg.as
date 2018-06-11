package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 * 0xE3
 */
public class PlaceOccupyMsg extends BaseMsg {
    /**占据是否成功,0:占据修炼位成功,1:占据修炼位失败(已被别人占领)*/
    public var result:uint = 0;
    /**修炼时长(秒)*/
    public var time:uint = 0;
    /**保护类型,0:不需保护,1:护法弟子,2:仙府禁法*/
    public var protectType:uint = 0;
    /**0:昆仑山,1:峨嵋山,2:黄山,3:武当山,4:九华山,5:衡山,6:无主之地*/
    public var type:uint = 0;
    public var remainTimes:uint = 0;
    public var fighterArr:Array;

    public function PlaceOccupyMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
            if (result == 0) {
                time = bytes.readUnsignedInt();
                protectType = BytesUtil.readByte1(bytes);
                remainTimes = BytesUtil.readByte1(bytes);
                type = BytesUtil.readByte1(bytes);
                fighterArr = [];
                var len:uint = BytesUtil.readByte1(bytes);
                for (var i:uint = 0; i < len; i++) {
                    fighterArr.push(bytes.readUnsignedInt());
                }
            }

        }
        catch (e:*) {

        }
        return true;
    }
}
}
