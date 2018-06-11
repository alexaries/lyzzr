package net.data.structs.saysay {
import utils.ByteArray;

public class SayNews {
    public var invites:uint = 0;
    public var invitesEx:uint = 0;
    public var tickers:uint = 0;
    public var friends:uint = 0;

    public static function read(dis:ByteArray, v:SayNews):SayNews {
        v.invites = dis.readUnsignedShort();
        v.tickers = dis.readUnsignedShort();
        v.friends = dis.readUnsignedShort();
        return v;
    }

    public static function write(dos:ByteArray, v:SayNews):ByteArray {
        dos.writeUnsignedInt(v.invites);
        dos.writeUnsignedInt(v.tickers);
        dos.writeUnsignedInt(v.friends);
        return dos;
    }
}
}