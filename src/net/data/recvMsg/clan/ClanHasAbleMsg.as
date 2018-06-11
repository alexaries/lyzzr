package net.data.recvMsg.clan {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * <code>(S->C)</code>消息协议 0x91
 * @author RyanCao
 *
 */
public class ClanHasAbleMsg extends BaseMsg {
    private var _money:uint;
    public var stationID:uint;
    public var clanId:uint;
    public var clanUid:BigInteger;

    public function ClanHasAbleMsg() {
        super();
    }

    private var _flag:int;
    private var _name:String;
    private var _gname:String;
    private var _createname:String;
    private var _level:int;
    private var _qq:String;
    private var _annonce:String;
    private var _purpose:String;
    private var _count:int;
    private var _proffer:int;
    private var _pos:int;
    private var _watchman:String;
    private var _count_max:uint;
    private var _taskProgress:uint;
    private var _exp:uint;
    public var _treeProgress:int;
    public var isAuto:int;
    public var _treePropLv:int;
    public var _treePropExp:int;
    public var exHp:int;
    public var exAttack:int;
    public var exDefend:int;

    /**
     * 本日捐献战功数量
     * @return
     *
     */
    public function get proffer():int {
        return _proffer;
    }

    /**
     * 返回宗族创始人名字
     * @return
     *
     */
    public function get createname():String {
        return _createname;
    }

    public function getPurpose():String {
        return _purpose;
    }

    public function getQq():String {
        return _qq;
    }

    public function getPos():int {
        return _pos;
    }

    public function getCount():int {
        return _count;
    }

    public function getAnnonce():String {
        return _annonce;
    }

    public function getLevel():int {
        return _level;
    }

    public function getGname():String {
        return _gname;
    }

    public function getName():String {
        return _name;
    }


    public function getFlag():int {
        return _flag;
    }

    public function get watchman():String {
        return _watchman;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            if (_flag == 0) {

                //新
                _pos = BytesUtil.readByte1(bytes);
                _count = BytesUtil.readByte1(bytes);
                _count_max = BytesUtil.readByte1(bytes);
//                _taskProgress = BytesUtil.readByte1(bytes);
                _exp = bytes.readUnsignedInt();
                _money = bytes.readUnsignedInt();
                _proffer = bytes.readUnsignedInt();
                stationID = BytesUtil.readByte1(bytes);
                _name = BytesUtil.readUserName(bytes);
                _gname = BytesUtil.readUserName(bytes);
                _createname = BytesUtil.readUserName(bytes);
                _watchman = BytesUtil.readUserName(bytes);
                _qq = bytes.readUTF();
                _annonce = bytes.readUTF();
                _purpose = bytes.readUTF();
                clanId = bytes.readUnsignedInt();
                var idBytes:ByteArray = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                clanUid = BytesUtil.readUint64(idBytes);
//					trace(clanUid+"帮主唯一ID:"+clanUid.valueOf())
                _treeProgress = bytes.readUnsignedInt();
                isAuto = BytesUtil.readByte1(bytes);
                _treePropLv = BytesUtil.readByte2(bytes);
                _treePropExp = bytes.readUnsignedInt();
                exHp = bytes.readUnsignedInt();
                exAttack = bytes.readUnsignedInt();
                exDefend = bytes.readUnsignedInt();
                //旧
//					_name 		= BytesUtil.readUserName(bytes);
//					_gname 		= BytesUtil.readUserName(bytes);
//					_createname	= BytesUtil.readUserName(bytes);
//					_watchman	= BytesUtil.readUserName(bytes);
//					_level 		= BytesUtil.readByte1(bytes);
//					_qq			= bytes.readUTF();
//					_annonce	= bytes.readUTF();
//					_purpose	= bytes.readUTF();
//					_count 		= BytesUtil.readByte1(bytes);
//					_proffer	= bytes.readUnsignedInt();
//					_pos  		= BytesUtil.readByte1(bytes);
            }
        } catch (e:*) {
            trace("e" + e);
        }
        return true;
    }

    public function get exp():uint {
        return _exp;
    }

    public function get taskProgress():uint {
        return _taskProgress;
    }

    public function get count_max():uint {
        return _count_max;
    }

    public function get money():uint {
        return _money;
    }


}
}