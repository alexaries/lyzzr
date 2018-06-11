package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议 0x18
 * @author RyanCao
 *
 */
public class UserHerosMsg extends BaseMsg {
    public function UserHerosMsg() {
        super();
    }

    private var _heros:Array;


    public function getHeros():Array {
        return _heros;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var len:int = BytesUtil.readByte1(bytes);
            _heros = new Array();

            for (var i:int = 0; i < len; i++) {
                _heros.push(bytes.readUnsignedInt());
            }

        } catch (e:*) {

        }
        return true;
    }


}
}