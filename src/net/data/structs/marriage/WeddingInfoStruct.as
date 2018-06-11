package net.data.structs.marriage {
import utils.ByteArray;

public class WeddingInfoStruct {
    public var date:uint;
    public var time:uint;
    public var spec:uint;

    public function WeddingInfoStruct() {
    }

    public static function read(bytes:ByteArray, v:WeddingInfoStruct):WeddingInfoStruct {
        v.date = bytes.readUnsignedInt();
        v.spec = bytes.readByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:WeddingInfoStruct):ByteArray {
        bytes.writeUnsignedInt(v.date);
        bytes.writeByte(v.spec);
        return bytes;
    }
}
}