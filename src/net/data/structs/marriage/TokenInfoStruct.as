package net.data.structs.marriage {
import utils.ByteArray;

public class TokenInfoStruct {
    public var id:uint;
    public var context:String;

    public function TokenInfoStruct() {
    }

    public static function read(bytes:ByteArray, v:TokenInfoStruct):TokenInfoStruct {
        v.id = bytes.readByte();
        v.context = bytes.readUTF();
        return v;
    }

    public static function write(bytes:ByteArray, v:TokenInfoStruct):ByteArray {
        bytes.writeByte(v.id);
        bytes.writeUTF(v.context);
        return bytes;
    }
}
}