/**
 * Created by Haru on 2017/8/4.
 */
package net.data.structs.lingShi {
import utils.ByteArray;

import net.utils.BytesUtil;

public class LingShiStruct {
    //当前的经验
    public var exp:uint;
    public var toolTip:String;
    //物品id
    public var goodId:uint;
    //流水号id
    public var flowId:Number;
    public var binding:uint;
    public var level:uint;
    public var type:uint;
    //品质颜色
    public var color:uint;
    public var price:uint;
    public var propId:uint;
    public var description:String;
    public var career:uint;
    public var imgURL:String;
    public var name:String;
    public var trumpExp:uint;//初始的经验
    public function LingShiStruct() {
    }

    static public function parse(bytes:ByteArray):LingShiStruct {

        var vo:LingShiStruct = new LingShiStruct();
        vo.update(bytes);
        return vo;
    }

    public function update(bytes:ByteArray):void {
        flowId = BytesUtil.readBigInt(bytes);
        if (flowId != 0) {
            binding = BytesUtil.readByte1(bytes);
            goodId = BytesUtil.readByte2(bytes);
            level = BytesUtil.readByte1(bytes);
            exp = bytes.readUnsignedInt();

        }
    }


}
}
