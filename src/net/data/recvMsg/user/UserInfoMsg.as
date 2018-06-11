package net.data.recvMsg.user {

import com.hurlant.math.BigInteger;

import utils.ByteArray;

import lang.LangArrayTxt;

import net.data.BaseMsg;
import net.data.structs.user.TitleStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x14 个人信息
 */
public class UserInfoMsg extends BaseMsg {
    private var _qqvipLv:uint;
    private var _qqvipYear:uint;
    //private var _mounts_id2 : uint;
    //private var _mounts_id3 : uint;

    public function UserInfoMsg() {
        super();
    }

    // 玩家坐骑ID
    private var _mounts_id:uint;
    // byte  	country  	所属阵营		1-天族			2-魔族
    private var _country:int;
    // uint  	gold  	元宝
    private var _gold:uint;
    // uint  	coupon  	礼券
    private var _coupon:uint;
    // uint  	tael  	银两
    private var _tael:uint;
    // uint  	coin  	铜钱
    private var _coin:uint;
    private var _clanName:String = "";
    // byte  	status  	状态:		0x01 - pk打开
    private var _status:uint;
    // ushort  	kill_value  	玩家罪恶值
    private var _kill_value:uint;
    private var _titleId:uint;
    // uint  	donation  	VIP充值元宝
    private var _donation:uint;
    // uint  	archivement  	战功
    private var _archivement:uint;
    // 声望
    private var _prestige:uint;
    public var archievScore:uint;
    // 玩家背包容量
    private var _capacity:uint = 0;
    //玩家魂魄空间容量
    private var _soul_capacity:uint = 0;
    //宝石
    public var jewel_capacity:uint = 0;
    //阵法
    public var formation_capacity:uint = 0;
    //元神
    public var sprite_capacity:uint = 0;
    /*灵珠*/
    public var lingzhu_capacity:uint = 0;
    private var _newsGuider1:uint = 0;
    private var _newsGuider2:uint = 0;
    // n * buffData  	buffData[ n ]  	buff列表
    private var _buffDatas:Array;
    //龙魂
    public var dragonsoul:uint;
    //帮派贡献
    public var clanProffer:uint;
    private var _titleDatas:Array;
    //地图id
    public var mapSkin:uint = 0;
    //帮派头衔
    private var _clanTitleID:uint = 0;
    //帮派称号数量
    private var _clanTitleNum:uint = 0;
    //帮派称号
    private var _clanTitleData:Array;

    /**
     * 是否隐藏VIP
     */
    public var isHideVIP:Boolean = false;
    /** 是否隐藏称号 */
    public var isHideTitle:Boolean = false;
    public var zhenyuanSoul:Vector.<uint> = new Vector.<uint>(4);
    public var zhenyuanSoulExp:Vector.<uint> = new Vector.<uint>(4);
    public var benchID:uint = 0;

    public var isYaoGuide:Boolean = false;
    public var isGetYao:Boolean = false;
    public var heroRefreshNum:int;
    public var _playerId:BigInteger;
    public var _playerId10:String;

    /**
     * 新手引导状态 2
     */
    public function get newsGuider2():uint {
        return _newsGuider2;
    }

    /**
     * 新手引导状态 1
     */
    public function get newsGuider1():uint {
        return _newsGuider1;
    }

    public function get capacity():uint {
        return _capacity;
    }

    public function get soul_capacity():uint {
        return _soul_capacity;
    }

    public function get titleId():uint {
        return _titleId;
    }

    public function get clanTitleID():uint {
        return _clanTitleID;
    }

    public function getTitleDatas():Array {
        return _titleDatas;
    }

    public function getclanTitleData():Array {
        return _clanTitleData;
    }

    public function getBuffDatas():Array {
        return _buffDatas;
    }

    public function getArchivement():uint {
        return _archivement;
    }

    public function getDonation():uint {
        return _donation;
    }

    public function getKill_value():uint {
        return _kill_value;
    }

    public function getStatus():uint {
        return _status;
    }

    public function getCoin():uint {
        return _coin;
    }

    public function getPrestige():uint {
        return _prestige;
    }

    public function clanName():String {
        return _clanName;
    }

    public function getTael():uint {
        return _tael;
    }

    public function getCoupon():uint {
        return _coupon;
    }

    public function getGold():uint {
        return _gold;
    }

    public function getCountry():int {
        return _country;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _buffDatas = new Array();
            _titleDatas = new Array();
            var idBytes:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            _playerId = BytesUtil.readUint64(idBytes);
            _playerId10 = bytes.readUTF();

            _country = BytesUtil.readByte1(bytes);

            _gold = bytes.readUnsignedInt();
            _coupon = bytes.readUnsignedInt();
            _tael = bytes.readUnsignedInt();
            _coin = bytes.readUnsignedInt();
            _clanName = BytesUtil.readUserName(bytes);
            _status = BytesUtil.readByte1(bytes);

            _titleId = BytesUtil.readByte2/*1*/(bytes); //头衔
            _kill_value = BytesUtil.readByte1(bytes);//保留

            _donation = bytes.readUnsignedInt();  //VIP充值元宝
            _qqvipLv = BytesUtil.readByte1(bytes); //QQvip等级
            _qqvipYear = BytesUtil.readByte1(bytes); //年费黄钻
            _archivement = bytes.readUnsignedInt(); //荣誉
            _prestige = bytes.readUnsignedInt();  //声望
            archievScore = bytes.readUnsignedInt();//成就积分

            _capacity = BytesUtil.readByte2(bytes);  //玩家背包容量
            _soul_capacity = BytesUtil.readByte2(bytes); //玩家魂背包容量
            jewel_capacity = BytesUtil.readByte2(bytes); //宝石背包容量
            formation_capacity = BytesUtil.readByte2(bytes); //阵法背包容量
            sprite_capacity = BytesUtil.readByte2(bytes); //元神背包容量
            lingzhu_capacity = BytesUtil.readByte2(bytes);//灵珠背包容量
            _newsGuider1 = bytes.readUnsignedInt();
            _newsGuider2 = bytes.readUnsignedInt();//新手引导任务完成阶段

            _mounts_id = BytesUtil.readByte1(bytes);//坐骑

            //_mounts_id2 = BytesUtil.readByte1(bytes);
            //_mounts_id3 = BytesUtil.readByte1(bytes);

            var len:int = BytesUtil.readByte1(bytes);//buffer数量

            for (var i:int = 0; i < len; i++) {
                // var buffdata:Object=new Object();
                // buffdata.buffId=BytesUtil.readByte1(bytes);
                // buffdata.timeLeft=bytes.readUnsignedInt();
                _buffDatas.push({buffId: BytesUtil.readByte1(bytes), timeLeft: bytes.readUnsignedInt()});
            }
            dragonsoul = bytes.readUnsignedInt(); //剑魂
            clanProffer = bytes.readUnsignedInt(); //帮派贡献
            //----------
            len = BytesUtil.readByte2(bytes); //称号数量
            for (i = 0; i < len; i++) {
                var vo:TitleStruct = new TitleStruct();
                vo.titleID = BytesUtil.readByte2/*1*/(bytes);
                vo.timeLimit = bytes.readUnsignedInt();
                _titleDatas.push(vo);
            }
            mapSkin = bytes.readUnsignedByte();//地图ID

            _clanTitleData = [];
            _clanTitleID = BytesUtil.readByte1(bytes);    //当前帮派ID
            _clanTitleNum = BytesUtil.readByte1(bytes);
            for (i = 0; i < _clanTitleNum; i++) {
                vo = new TitleStruct();
                vo.titleID = BytesUtil.readByte1(bytes);
                vo.deadLine = bytes.readUnsignedInt();
                vo.name = LangArrayTxt.NAME_OF_CLAN[vo.titleID];
                if (vo.titleID != 0) {
                    _clanTitleData.push(vo);
                }
            }
            isHideVIP = bytes.readBoolean();
            isHideTitle = bytes.readBoolean();
            for (i = 0; i < 4; i++) {
                zhenyuanSoul[i] = bytes.readUnsignedByte();
                zhenyuanSoulExp[i] = bytes.readUnsignedInt();
            }

            benchID = bytes.readUnsignedShort();
            isYaoGuide = bytes.readBoolean();
            isGetYao = bytes.readBoolean();
            heroRefreshNum = BytesUtil.readByte2(bytes);
            //test
            //isYaoGuide = true;

        } catch (e:*) {
        }
        return true;
    }

    public function get mounts_id():uint {
        return _mounts_id;
    }

    public function get qqvipLv():uint {
        return _qqvipLv;
    }

    public function get qqvipYear():uint {
        return _qqvipYear;
    }

//		public function get mounts_id2() : uint {
//			return _mounts_id2;
//		}

//		public function get mounts_id3() : uint {
//			return _mounts_id3;
//		}


}
}
