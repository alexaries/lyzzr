/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-1-13
 * Time: 上午11:13
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {
import utils.ByteArray;

import net.utils.BytesUtil;

public class FundStruct {
    public var type:uint;
    public var totalNum:uint;
    public var flag:uint;
    public var info:uint;

    public function FundStruct() {
    }

    public static function read(bytes:ByteArray):FundStruct {
        var struct:FundStruct = new FundStruct;
        struct.type = BytesUtil.readByte1(bytes);
        var _flag:int;
        switch (struct.type) {
            case 0x00:
            case 0x01:
                struct.totalNum = bytes.readUnsignedShort();
                struct.flag = bytes.readUnsignedInt();
                /*                for(var i:int = 0; i < 6; i ++){
                 struct.flagArr[i] = LunaUtil.readBit(_flag,i)?1:0;
                 }*/
                break;
            case 0x02:
                struct.info = bytes.readUnsignedInt();
                break;
        }
        return struct;
    }
}
}
