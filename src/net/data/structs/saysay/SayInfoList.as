package net.data.structs.saysay {
import utils.ByteArray;

public dynamic class SayInfoList extends Array {
    public static function read(dis:ByteArray, v:SayInfoList):SayInfoList {
        var count:uint = dis.readUnsignedByte();
        for (var i:uint = 0; i < count; i++) {
            var m:SayInfo = SayInfo.read(dis, new SayInfo);
            v.push(m);
        }
        return v;
    }

    public static function write(dos:ByteArray, v:SayInfoList):ByteArray {
        var count:uint = v.length;
        dos.writeInt(count);
        for (var i:uint = 0; i < count; i++) {
            var m:SayInfo = v[i] as SayInfo;
            SayInfo.write(dos, m);
        }
        return dos;
    }
}
}