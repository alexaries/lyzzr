package net.data.structs.saysay {
import utils.ByteArray;

import net.utils.BytesUtil;

public class SayGet {
    public var name:String;
    public var country:uint;
    public var size:uint;
    public var id:uint;
    public var num:uint;
    public var list:SayItemList;

    public static function read(bytes:ByteArray, v:SayGet):SayGet {
        v.name = BytesUtil.readUserName(bytes);
        v.country = bytes.readUnsignedByte();
        v.list = SayItemList.read(bytes, new SayItemList);
//			v.size = bytes.readUnsignedByte();
//			v.id = bytes.readUnsignedShort();
//			v.num = bytes.readUnsignedByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:SayGet):ByteArray {
        BytesUtil.writeUserName(v.name, bytes);
        bytes.writeByte(v.country);
        SayItemList.write(bytes, v.list);
//			bytes.writeByte(v.size);
//			bytes.writeUnsignedInt(v.id);
//			bytes.writeByte(v.num);
        return bytes;
    }
}
}