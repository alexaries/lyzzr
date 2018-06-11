package net.data.recvMsg.petspace {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA8 灵宠空间
 *
 */
public class PetspaceMsg extends BaseMsg {
    public function PetspaceMsg() {
        super();
    }

    public var type:uint;
    private var num:uint;
    public var step:uint = 0;
    public var steps:Array;

    public var value1:uint;
    public var value2:uint;
    public var shouhun:uint = 0;
    public var like:uint;
    public var xianyuan:uint;

    public var isConvert:int;
    public var pets:Array;

    public var endTimes:uint = 0;//到大最后一个的次数

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        type = BytesUtil.readByte1(bytes);
        var i:uint = 0;
        switch (type) {
            case 1:
                step = BytesUtil.readByte1(bytes);
                var count:uint = BytesUtil.readByte1(bytes);
                pets = new Array(count);
                if (count > 0) {
                    for (i = 0; i < count; i++) {
                        pets[i] = bytes.readUnsignedInt();
                    }
                }
                break;
            case 2:
                var len:uint = BytesUtil.readByte2(bytes);
                steps = new Array(len);
                endTimes = 0;
                for (i = 0; i < len; i++) {
                    steps[i] = BytesUtil.readByte1(bytes);
                    if (steps[i] == 5) {
                        endTimes++;
                    }
                }
                value1 = bytes.readUnsignedInt();
                value2 = bytes.readUnsignedInt();
                shouhun = bytes.readUnsignedInt();
                like = BytesUtil.readByte2(bytes);
                xianyuan = bytes.readUnsignedInt();
                isConvert = BytesUtil.readByte1(bytes);
                var str:String = BytesUtil.readUserName(bytes);
                pets = [];
                if (str.length > 0) {
                    var arr:Array = str.split(",");
                    for (var j:int = 0; j < arr.length; j++) {
                        if (int(arr[j]) > 0)
                            pets.push(int(arr[j]));
                    }
                }
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                pets = []
                var petId:int = bytes.readUnsignedInt();
                pets[0] = petId;
                like = BytesUtil.readByte2(bytes);
                break;
        }
        return true;
    }
}
}