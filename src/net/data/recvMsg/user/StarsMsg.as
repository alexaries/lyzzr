package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;

/*
 * */
public class StarsMsg extends BaseMsg {
    public var type:uint;
    public var heroId:uint;
    public var stars_num:Number;
    public var stars_lv:Number;
    public var stars_val:Number;
    public var gem1:uint;
    public var gem2:uint;
    public var gem3:uint;
    public var gem4:uint;
    public var gem5:uint;
    public var gem6:uint;
    public var gem7:uint;
    public var gem8:uint;
    public var stars_rank_cur:uint;
    public var stars_rank_max:uint;

    public function StarsMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            heroId = bytes.readShort();
            stars_num = bytes.readUnsignedInt();
            stars_lv = bytes.readByte();
            stars_val = bytes.readUnsignedInt();
            gem1 = bytes.readUnsignedShort();
            gem2 = bytes.readUnsignedShort();
            gem3 = bytes.readUnsignedShort();
            gem4 = bytes.readUnsignedShort();
            gem5 = bytes.readUnsignedShort();
            gem6 = bytes.readUnsignedShort();
            gem7 = bytes.readUnsignedShort();
            gem8 = bytes.readUnsignedShort();
            stars_rank_cur = bytes.readUnsignedShort();
            stars_rank_max = bytes.readUnsignedShort();
            type = bytes.readByte();

        }
        catch (e:*) {

        }

        return true;
    }
}
}