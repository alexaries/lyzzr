package net.data.structs.saysay {
import utils.ByteArray;

public class SayItem {
    public var id:uint;
    public var num:uint;

    public static function read(bytes:ByteArray, v:SayItem):SayItem {
        v.id = bytes.readUnsignedShort();
        v.num = bytes.readUnsignedByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:SayItem):ByteArray {
        bytes.writeUnsignedInt(v.id);
        bytes.writeByte(v.num);
        return bytes;
    }
}
}