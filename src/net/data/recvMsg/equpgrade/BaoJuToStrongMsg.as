package net.data.recvMsg.equpgrade {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 装备强化消息<br>
 * (S->C)0x40
 * @author RyanCao
 *
 */
public class BaoJuToStrongMsg extends BaseMsg {
    public function BaoJuToStrongMsg() {
        super();
    }

    public var type:int;
    private var _result:int;
    //古籍
    public var bookId:uint;
    public var itemId:Number;

    public var bind:uint;
    public var value:uint;
    public var max:uint;
    public var arr:Array;

    public var tiaomuValue:uint = 0;//条目调整值
    public var purpleValue:uint = 0;//紫色属性值
    public var orangeValue:uint = 0;//橙色属性值

    public var itemList:Array;

    public function get result():int {
        return _result;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            if (type == 1) {
                _result = BytesUtil.readByte1(bytes);
                var n:uint = BytesUtil.readByte1(bytes);
                if (n > 0) {
                    arr = new Array(n);
                    for (var i:int = 0; i < n; i++) {
                        arr[i] = bytes.readShort();
                    }

                }
            } else if (type > 1 && type < 5) {
                _result = BytesUtil.readByte1(bytes);
            }
            if (type == 5) {
                bookId = bytes.readUnsignedShort();
                itemId = bytes.readUnsignedShort();
                max = bytes.readUnsignedInt();
                value = bytes.readUnsignedInt();
                bind = BytesUtil.readByte1(bytes);

                tiaomuValue = bytes.readUnsignedByte();
                purpleValue = bytes.readUnsignedByte();
                orangeValue = bytes.readUnsignedByte();
            }
            if (type == 6) {
                itemId = BytesUtil.readBigInt(bytes)//bytes.readUnsignedInt() ;
            }
            else if (type == 7) {
                itemList = [];
                var count:uint = bytes.readUnsignedShort();
                for (i = 0; i < count; i++) {
                    var flowID:Number = BytesUtil.readBigInt(bytes)
                    var result:uint = bytes.readUnsignedByte();
                    n = bytes.readUnsignedByte();
                    arr = new Array(n);
                    for (var t:int = 0; t < n; t++) {
                        arr[t] = bytes.readShort();
                    }
                    var resultObject:Object = {flowID: flowID, result: result, propArray: arr};
                    itemList[i] = resultObject;
                }
            }
        } catch (e:*) {
//				
        }
        return true;
    }
}
}