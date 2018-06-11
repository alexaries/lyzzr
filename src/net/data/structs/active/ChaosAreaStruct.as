/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-2-25
 * Time: 上午11:04
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {

import utils.ByteArray;

import net.utils.BytesUtil;

public class ChaosAreaStruct {
    public var type:uint;
    public var score:uint;
    public var rank:uint;
    public var info:uint;
    public var list1:Array;
    public var list2:Array;

    public function ChaosAreaStruct() {
    }

    public static function read(bytes:ByteArray):ChaosAreaStruct {
        var struct:ChaosAreaStruct = new ChaosAreaStruct;
        var len:uint;
        var i:uint;
        var arr:Array = [];
        var flag:Boolean = false;
        struct.type = BytesUtil.readByte1(bytes);
        switch (struct.type) {
            case 0x00:
                struct.score = bytes.readUnsignedShort();
                struct.rank = bytes.readUnsignedShort();
                struct.info = bytes.readUnsignedInt();
                break;
            case 0x01:
                struct.list1 = [];
                len = bytes.readUnsignedShort();
                for (i = 0; i < len; i++) {
                    arr = [BytesUtil.readUserName(bytes), BytesUtil.readByte1(bytes), bytes.readUnsignedShort()];
                    flag = (arr[2]) > 0;
                    if (flag) {
                        struct.list1.push(arr);
                    }
                }
                break;
            case 0x02:
                struct.list2 = [];
                len = bytes.readByte();
                for (i = 0; i < len; i++) {
                    arr = [BytesUtil.readUserName(bytes), BytesUtil.readByte1(bytes), bytes.readUnsignedShort()];
                    struct.list2.push(arr);
                }
                break;
        }
        return struct;
    }
}
}
