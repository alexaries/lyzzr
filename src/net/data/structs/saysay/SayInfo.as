package net.data.structs.saysay {
import utils.ByteArray;

public class SayInfo {
    public var stutas:uint;

    public static function read(bytes:ByteArray, v:SayInfo):SayInfo {
        v.stutas = bytes.readByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:SayInfo):ByteArray {
        bytes.writeByte(v.stutas);
        return bytes;
    }
}
}