package net.data.recvMsg.user {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class UserNormalHeroJoinMsg extends BaseMsg {
    public function UserNormalHeroJoinMsg() {
        super();
    }

    private var _id:uint;
    private var _name:String;
    private var _cls:uint;
    private var _sex:uint;
    private var _portrait:uint;
    private var _level:uint;
    private var _exp:uint;
    private var _potential:Number;


    public function get potential():Number {
        return _potential;
    }

    public function get exp():uint {
        return _exp;
    }

    public function get level():uint {
        return _level;
    }

    public function get portrait():uint {
        return _portrait;
    }

    public function get sex():uint {
        return _sex;
    }

    public function get cls():uint {
        return _cls;
    }

    public function get name():String {
        return _name;
    }

    public function get id():uint {
        return _id;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _id = bytes.readUnsignedInt();
            _name = BytesUtil.readUserName(bytes);
            _cls = BytesUtil.readByte1(bytes);
            _sex = BytesUtil.readByte1(bytes);
            _portrait = BytesUtil.readByte1(bytes);
            _level = BytesUtil.readByte1(bytes);
            _exp = bytes.readUnsignedInt();
            _potential = bytes.readFloat();

        } catch (e:*) {

        }
        return true;
    }
}
}