package net.data.recvMsg.gold {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GoldInfoMsg extends BaseMsg {
    /**黄钻等级,0:不是黄钻用户,1,2,3,4,5,6,7级*/
    public var level:uint = 0;
    /**是否为年费黄钻用户,0:不是,1:是*/
    public var isYear:uint = 0;
    /**是否领取过奖励,0:没领取过,1:领过1-7级奖励,2:领过年费奖励*/
    public var isGot:uint = 0;
    public var levelItemArr:Array;
    public var yearItemArr:Array;
    public var type:uint = 0;

    public function GoldInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            levelItemArr = [];
            yearItemArr = [];
            level = BytesUtil.readByte1(bytes);
            isYear = BytesUtil.readByte1(bytes);
            isGot = BytesUtil.readByte1(bytes);
            var levelNum:uint = BytesUtil.readByte1(bytes);
            type = BytesUtil.readByte1(bytes);
            for (var i:uint = 0; i < levelNum; i++) {
                levelItemArr[i] = [];
                var itemNum:uint = BytesUtil.readByte1(bytes);
                for (var j:uint = 0; j < itemNum; j++) {
                    levelItemArr[i].push([bytes.readUnsignedInt(), BytesUtil.readByte1(bytes)]);
                }
            }
            var num:uint = BytesUtil.readByte1(bytes);
            for (var k:uint = 0; k < num; k++) {
                yearItemArr.push([bytes.readUnsignedInt(), BytesUtil.readByte1(bytes)]);
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}
