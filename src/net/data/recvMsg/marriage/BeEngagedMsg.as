package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.marriage.TokenInfoStruct;
import net.data.structs.marriage.WeddingInfoStruct;

public class BeEngagedMsg extends BaseMsg {
    public var type:uint;
    public var wedding:WeddingInfoStruct;
    public var token:TokenInfoStruct;

    public function BeEngagedMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = bytes.readByte();
            switch (type) {
                case 1:
                    wedding = WeddingInfoStruct.read(bytes, new WeddingInfoStruct);
                    token = TokenInfoStruct.read(bytes, new TokenInfoStruct);
                    break;
            }
        } catch (e:*) {

        }
        return true;
    }
}
}