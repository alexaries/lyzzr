package net.data.recvMsg.marriage {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.marriage.PlayerStruct;

public class PlayerInfoMsg extends BaseMsg {
    public var playerStruct:PlayerStruct;

    public function PlayerInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            playerStruct = PlayerStruct.read(bytes, new PlayerStruct);
        } catch (e:*) {

        }
        return true;
    }
}
}