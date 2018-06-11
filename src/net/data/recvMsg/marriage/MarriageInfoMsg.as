package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.marriage.PlayerInfoStruct;
import net.data.structs.marriage.TokenInfoStruct;
import net.data.structs.marriage.WeddingInfoStruct;

public class MarriageInfoMsg extends BaseMsg {
    public var type1:uint;
    public var type2:uint;
    public var lover:PlayerInfoStruct;
    public var token1:TokenInfoStruct;
    public var token:TokenInfoStruct;
    public var wedding:WeddingInfoStruct;
    public var cancel:uint;
    public var time:uint;

    public function MarriageInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var flag:uint;
            type1 = bytes.readByte();
            type2 = bytes.readByte();
            cancel = bytes.readByte();
            flag = bytes.readByte();
            if (flag) {
                lover = PlayerInfoStruct.read(bytes, new PlayerInfoStruct);
                token1 = TokenInfoStruct.read(bytes, new TokenInfoStruct);
            }
            token = TokenInfoStruct.read(bytes, new TokenInfoStruct);
            wedding = WeddingInfoStruct.read(bytes, new WeddingInfoStruct);
            time = bytes.readUnsignedInt();
        } catch (e:*) {

        }
        return true;
    }
}
}