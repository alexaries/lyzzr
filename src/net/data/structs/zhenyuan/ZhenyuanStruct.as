/**
 * Created by Haru on 2017/8/4.
 */
package net.data.structs.zhenyuan {
import utils.ByteArray;

import net.data.structs.pack.ItemStruct;
import net.utils.BytesUtil;

public class ZhenyuanStruct {
    public var itemID:Number;
    public var flowID:Number;
    public var propertyVector:Array = [];
    public var addPropertyVector:Array = [];
    public var name:String;
    public var quality:uint;
    public var imgURL:String;
    public var toolTip:String;

    public function ZhenyuanStruct() {
    }

    static public function parseZhenyuanVO(bytes:ByteArray, itemStruct:ItemStruct, getItemID:uint = 0):ZhenyuanStruct {
        var zhenyuan:ZhenyuanStruct = new ZhenyuanStruct();


        var itemid:Number = itemStruct.itemId;


        zhenyuan.itemID = itemid;
        zhenyuan.flowID = BytesUtil.readBigInt(bytes);

        var value:uint = bytes.readUnsignedByte();
        var propertyLength:uint = value & 15;
        var addPropertyLength:uint = value >> 4;
        zhenyuan.propertyVector.length = propertyLength;
        for (var i:int = 0; i < propertyLength; i++) {
            zhenyuan.propertyVector[i] = {};
            zhenyuan.propertyVector[i].id = bytes.readUnsignedByte();
            zhenyuan.propertyVector[i].value = bytes.readUnsignedShort();
        }


        zhenyuan.addPropertyVector.length = addPropertyLength;
        for (i = 0; i < addPropertyLength; i++) {
            zhenyuan.addPropertyVector[i] = {};
            zhenyuan.addPropertyVector[i].configID = bytes.readUnsignedShort();
            zhenyuan.addPropertyVector[i].value = bytes.readUnsignedShort();
        }

        return zhenyuan;
    }
}
}
