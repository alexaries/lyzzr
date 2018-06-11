package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * 消息类型  0x96
 *
 * 返回该宗族 的信息
 * @author RyanCao<br>
 *  uint    clanID    宗族ID<br>
 *    string    purpose    宗族宣言<br>
 *    string    qq    宗族QQ群
 */
public class ClanReqItemMsg extends BaseMsg {
    private var _qq:String;

    public function ClanReqItemMsg() {
        super();
    }

    private var _clanID:uint;
    private var _purpose:String;

    public function get purpose():String {
        return _purpose;
    }

    public function get clanID():uint {
        return _clanID;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _clanID = bytes.readUnsignedInt();
            _qq = bytes.readUTF();
            _purpose = bytes.readUTF();
        } catch (e:*) {
        }
        return true;
    }

    public function get qq():String {
        return _qq;
    }
}
}