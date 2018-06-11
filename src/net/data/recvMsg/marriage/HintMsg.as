package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.marriage.PlayerInfoStruct;
import net.utils.BytesUtil;

public class HintMsg extends BaseMsg {
    public var type:uint;
    public var player:PlayerInfoStruct;
    ;
    public function HintMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = bytes.readByte();
            player = new PlayerInfoStruct;
            var idBytes:ByteArray;
            idBytes = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            player.id = BytesUtil.readUint64(idBytes);
            player.name = BytesUtil.readUserName(bytes);
            player.color = bytes.readByte();
        } catch (e:*) {

        }
        return true;
    }
}
}