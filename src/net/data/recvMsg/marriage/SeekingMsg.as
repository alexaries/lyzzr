package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.marriage.PlayerInfoStruct;
import net.data.structs.marriage.TokenInfoStruct;

public class SeekingMsg extends BaseMsg {
    public var type:uint;
    public var token:TokenInfoStruct;
    public var lover:PlayerInfoStruct;

    public function SeekingMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = bytes.readByte();
            switch (type) {
                case 0:
                case 2:
                    token = TokenInfoStruct.read(bytes, new TokenInfoStruct);
                    break;
                case 6:
                case 7:
                case 8:
                    lover = PlayerInfoStruct.read(bytes, new PlayerInfoStruct);
                    break;
            }
        } catch (e:*) {

        }
        return true;
    }
}
}