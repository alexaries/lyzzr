package net.data.structs.saysay {
import utils.ByteArray;

public dynamic class SayItemList extends Array {
    public static function read(dis:ByteArray, v:SayItemList):SayItemList {
        var count:uint = dis.readUnsignedByte();
        for (var i:uint = 0; i < count; i++) {
            var m:SayItem = SayItem.read(dis, new SayItem);
            v.push(m);
        }
        return v;
    }

    public static function write(dos:ByteArray, v:SayItemList):ByteArray {
        var count:uint = v.length;
        dos.writeInt(count);
        for (var i:uint = 0; i < count; i++) {
            var m:SayItem = v[i] as SayItem;
            SayItem.write(dos, m);
        }
        return dos;
    }
}
}