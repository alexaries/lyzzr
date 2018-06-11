package net.data.structs.saysay {
import utils.ByteArray;

/**
 * @author john
 */
public class SayItemStruct {
    public var index:uint;
    public var stutas:uint;

    public static function read(dis:ByteArray, sayItemStruct:SayItemStruct):SayItemStruct {
        sayItemStruct.index = dis.readByte();
        sayItemStruct.stutas = dis.readByte();
        return sayItemStruct;
    }

    public static function write(dos:ByteArray, sayItemStruct:SayItemStruct):ByteArray {
        dos.writeByte(sayItemStruct.index);
        dos.writeByte(sayItemStruct.stutas);
        return dos;
    }
}
}
