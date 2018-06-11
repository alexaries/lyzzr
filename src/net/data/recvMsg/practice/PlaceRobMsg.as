package net.data.recvMsg.practice {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class PlaceRobMsg extends BaseMsg {
    /**占位是否成功,0:成功,1:失败,2:该位置玩家信息已改变,请刷新*/
    public var result:uint = 0;
    /**0:昆仑山,1:黄山,2:武当山,3:九华山,4:衡山,5:喜马拉雅山*/
    public var type:uint = 0;
    /**当前索引位置*/
    public var numIndex:uint = 0;

    public function PlaceRobMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            result = BytesUtil.readByte1(bytes);
            if (result == 0) {
                type = BytesUtil.readByte1(bytes);
                numIndex = BytesUtil.readByte1(bytes);
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}
