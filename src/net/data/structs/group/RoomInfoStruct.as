package net.data.structs.group {
import com.hurlant.math.BigInteger;

/**
 * @author john
 */
public class RoomInfoStruct {
    public var copyId:uint;
    public var roomId:uint;
    public var leaderId:BigInteger;
    public var st:uint;
    public var ed:uint;
    public var hasPWD:uint;
    public var count:uint;
    public var playerList:Array;
}
}
