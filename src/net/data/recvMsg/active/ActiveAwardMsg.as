package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class ActiveAwardMsg extends BaseMsg {
    public var selectedItem:uint = 0;
    public var score:uint;
    public var goods:Array;
    public var result:uint;
    public var itemid:uint;
    public var num:int;
    public var money:uint;
    public var state:uint;
    public var flag:uint;
    public var ret:uint;
    public var name:String;
    public var camp:uint;

    public function ActiveAwardMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        selectedItem = BytesUtil.readByte1(bytes);
        switch (selectedItem) {
            case 10:
                score = bytes.readUnsignedInt();
                var len:int = BytesUtil.readByte1(bytes);
                goods = [];
                for (var i:int = 0; i < len; i++) {
                    goods.push({itemid: bytes.readInt(), score: bytes.readInt(), num: bytes.readInt()});
                }
                break;
            case 11:
                result = BytesUtil.readByte1(bytes);
                if (result == 0) {
                    score = bytes.readUnsignedInt();
                    itemid = bytes.readUnsignedInt();
                    num = bytes.readInt();
                }
                break;
            case 12:
                money = bytes.readUnsignedInt();
                score = bytes.readUnsignedInt();
                break;
            case 13:
                result = BytesUtil.readByte1(bytes);
                break;
            case 20:
                state = BytesUtil.readByte1(bytes);
                break;
            case 21:
                flag = BytesUtil.readByte1(bytes);

                if (flag == 2) {
                    ret = BytesUtil.readByte4(bytes);
                    name = BytesUtil.readUserName(bytes);
                    camp = BytesUtil.readByte1(bytes);
                } else {
                    ret = BytesUtil.readByte1(bytes);
                }


                break;
            case 22:
                flag = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte2(bytes);
                break;
            default:
                break;
        }

        return true;
    }
}
}
