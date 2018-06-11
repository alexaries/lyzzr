package net.data.recvMsg.active {
import com.game.module.activity.vo.LimitBuyVO;
import com.game.module.newVip.proxy.NewVipVo;

import net.data.BaseMsg;
import net.data.structs.active.ChaosAreaStruct;
import net.data.structs.active.FundStruct;
import net.data.structs.active.SevendayStruct;
import net.data.structs.active.TianYuanStruct;
import net.data.structs.active.TianshuStruct;
import net.utils.BytesUtil;

import utils.ByteArray;
import utils.LunaUtil;

public class ActivityAllMsg extends BaseMsg {

    public var byte:ByteArray;
    private var _type:uint = 0;

    /** 七夕活动的类型*/
    private var _sevenLoveType:uint = 0;
    private var _sltype:uint = 0;
    private var _sllover:String = "";
    private var _slbind:uint = 0;
    private var _slpos:uint = 0;
    private var _slevent:uint = 0;
    private var _slscore:uint = 0;

    private var _slplace:uint = 0;
    private var _slcount:uint = 0;
    private var _slLoverArr:Array;
    private var _slSetLover:uint = 0;
    private var _slrankNum:int = 0;
    /**
     * 充值 还是 消费
     */
    public var rankType:uint = 0;
    /**
     * 0全部排行
     * 1排行更新
     * 2我的排行
     */
    public var rankOptType:uint;
    /**
     *排行数据
     */
    public var rankData:Array;
    /**
     * 排行更新数据
     */
    public var rankChangeItem:Array;
    /**
     * 自身排行等级
     */
    public var rankOwnerInfo:Array;

    /**
     *活动开启标志
     */
    public var openFlag:int;
    /**
     *活动开启标志
     */
    public var checkFlag:int;
    /**
     *已经购买的次数
     */
    public var hasBuyTimes:int;
    public var hasBuyTimes_2:int;
    /**
     *总充值仙石数
     */
    public var totalrecharge:uint;
    /**
     * 国庆登陆信息
     * */
    public var loginInfo:Array;
    /**
     * 国庆在线信息
     * */
    public var onlineInfo:Array;
    /** 数字组合
     * */
    public var nums:Array;
    /**
     * 奖励离别
     * */
    public var rewards:Array;

    public var result:uint;

    public var toNum:uint;
    public var tianshuStruct:TianshuStruct;
    public var fundStruct:FundStruct;
    public var chaosAreaStruct:ChaosAreaStruct;
    public var tianyuanStruct:TianYuanStruct;
    public var town:uint;
    public var loc:uint;
    public var leftTime:uint;
    public var flag:uint;
    public var dayNum:uint;
    public var totalNum:uint;
    public var getDayGift:uint;
    public var getTotal100Gift:Boolean;
    public var getTotal200Gift:Boolean;
    public var getTotal300Gift:Boolean;
    public var acceptCount:uint;

    //开服狂欢
    private var _kfType:int;
    private var _sdScore:int;
    private var _sdBegtime:int;
    private var _sdRewardBits:Vector.<Boolean> = new Vector.<Boolean>(8);
    private var _sdInfoData:Array;

    //状态刷新
    private var _rtype:int;
    private var _rdata:SevendayStruct;

    //单笔充值
    private var _danBegTime:int;
    private var _danEndTime:int;
    private var _danInfoData:Array;

    //单日累充
    private var _leiBegTime:int;
    private var _leiEndTime:int;
    private var _leiInfoData:Array;

    //限时购买
    public var limitStartTime:int;
    public var limitEndTime:int;
    public var limtArr:Array;
    public var refreshLimitVO:LimitBuyVO
    //累计登陆
    private var _signday:int;
    private var _signbits:Array = [];

    /**
     * 0:未分享,时间戳:已分享,UInt32(-1):已经领奖
     */
    public var sharetime:int;
    /**
     * 0:未关注,时间戳:已关注,UInt32(-1):已经领奖
     */
    public var concerntime:int;
    public var bytesArr:ByteArray;
    public function ActivityAllMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        byte = bytes;
        bytes.position = 0;
        bytesArr = bytes;
        _type = BytesUtil.readByte1(bytes);
        switch (_type) {
            case 0x01:
            case 0x03:
            case 0x09:
                _sevenLoveType = BytesUtil.readByte1(bytes);
                if (_sevenLoveType == 0x01) {
                    _sltype = BytesUtil.readByte1(bytes);
                    if (_sltype == 1) {
                        _sllover = BytesUtil.readUserName(bytes);
                        _slbind = BytesUtil.readByte1(bytes);
                        _slpos = BytesUtil.readByte1(bytes);
                        _slevent = BytesUtil.readByte1(bytes);
                    } else if (_sltype == 2) {
                        _slplace = bytes.readUnsignedInt();
                        _slscore = bytes.readUnsignedInt();
                        _slcount = BytesUtil.readByte1(bytes);
                        _slLoverArr = [];
                        for (var i:int = 0; i < _slcount; i++) {
                            var loverObj:Object = new Object();
                            loverObj.lN1 = BytesUtil.readUserName(bytes);
                            loverObj.lN12 = BytesUtil.readUserName(bytes);
                            loverObj.Score = bytes.readUnsignedInt();
                            _slLoverArr.push([loverObj.lN1, loverObj.lN12, loverObj.Score]);
                        }
                    }

                } else if (_sevenLoveType == 0x02) {
                    _slSetLover = BytesUtil.readByte1(bytes);
                } else if (_sevenLoveType == 0x03) {
                    _slrankNum = BytesUtil.readByte1(bytes);
                }
                break;
            case 2:
                //消费排行
                rankType = BytesUtil.readByte1(bytes);
                switch (rankType) {
                    case 0x01:
                    case 0x02:
                    case 0x03:
                    case 0x04:
                    case 0x05:
                        //充值排行
                        //消费排行
                        //物品消费排行
                        rankOptType = BytesUtil.readByte1(bytes);
                        switch (rankOptType) {
                            case 0:
                                rankData = [];
                                var len:int = BytesUtil.readByte1(bytes);
                                for (var j:int = 0; j < len; j++) {
                                    rankData.push([BytesUtil.readUserName(bytes), bytes.readUnsignedInt(), j + 1, rankType, BytesUtil.readByte1(bytes)]);
                                }
                                break;
                            case 1:
                                rankChangeItem = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt(), BytesUtil.readByte1(bytes), rankType, BytesUtil.readByte1(bytes)];
                                break;
                            case 2:
                                rankOwnerInfo = [bytes.readUnsignedInt(), BytesUtil.readByte1(bytes)];
                                break;
                            default:
                                break;
                        }
                        break;
                    default:
                        break;
                }
                break;
            case 0x0c:
                rankType = BytesUtil.readByte1(bytes);
                switch (rankType) {
                    case 0x01:
                        rankOptType = BytesUtil.readByte1(bytes);
                        break;
                }
                break;
            case 0x0e:
                rankType = BytesUtil.readByte1(bytes);
                if (rankType == 1) {
                    var num:uint = BytesUtil.readByte1(bytes);
                    rankData = [];
                    for (var k:int = 0; k < num; k++) {
                        rankData.push(BytesUtil.readByte1(bytes));
                    }
                } else if (rankType == 2) {
                    rankOptType = BytesUtil.readByte1(bytes);
                }
                break;
            case 0x42:
                openFlag = bytes.readByte();
                hasBuyTimes = bytes.readByte();
                totalrecharge = bytes.readUnsignedInt();
                hasBuyTimes_2 = bytes.readByte();
                break;
            case 0x28:
                fundStruct = FundStruct.read(bytes);
                break;
            case 0x30:
                chaosAreaStruct = ChaosAreaStruct.read(bytes);
                break;
            case 0x31:
                tianyuanStruct = TianYuanStruct.read(bytes);
                break;
            case 0x20:
                rankType = BytesUtil.readByte1(bytes);
                switch (rankType) {
                    case 0x01:
                        tianshuStruct = TianshuStruct.read0x01(bytes);
                        break;
                    case 0x03:
                        tianshuStruct = TianshuStruct.read0x03(bytes);
                        break;
                    case 0x04:
                        tianshuStruct = TianshuStruct.read0x04(bytes);
                        break;
                    case 0x05:
                        tianshuStruct = TianshuStruct.read0x05(bytes);
                        break;
                    case 0x07:
                        tianshuStruct = TianshuStruct.read0x07(bytes);
                        break;
                    case 0x02:
                        openFlag = BytesUtil.readByte1(bytes);
                        switch (openFlag) {
                            case 0x00:
                                loginInfo = [bytes.readUnsignedByte(), bytes.readUnsignedShort()];
                                break;
                            case 0x01:
                                onlineInfo = [bytes.readUnsignedInt(), bytes.readUnsignedByte()];
                                break;
                        }
                        break;
                }
                break;
            case 0x44:
                rankType = BytesUtil.readByte1(bytes);
                var i2:int;
                var obj:Object;
                switch (rankType) {
                    case 0:
                        openFlag = BytesUtil.readByte1(bytes);
                        if (!openFlag)
                            break;
                        checkFlag = BytesUtil.readByte1(bytes);
                        nums = [
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes)
                        ];
                        if (!checkFlag)
                            break;
                        rewards = [];
                        for (i2 = 0; i2 < 7; i2++) {
                            obj = {};
                            obj.enable = BytesUtil.readByte1(bytes);
                            obj.itemid = BytesUtil.readByte2(bytes);
                            obj.itemNum = BytesUtil.readByte1(bytes);
                            rewards.push(obj);
                        }
                        break;
                    case 1:
                        result = BytesUtil.readByte1(bytes);
                        if (result)
                            break;
                        nums = [
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes),
                            BytesUtil.readByte1(bytes)
                        ];
                        break;
                    case 2:
                    case 3:
                    case 7:
                        result = BytesUtil.readByte1(bytes);
                        if (result)
                            break;
                        toNum = BytesUtil.readByte1(bytes);
                        break;
                    case 5:
                        rewards = [];
                        for (i2 = 0; i2 < 7; i2++) {
                            obj = {};
                            obj.enable = BytesUtil.readByte1(bytes);
                            obj.itemid = BytesUtil.readByte2(bytes);
                            obj.itemNum = BytesUtil.readByte1(bytes);
                            rewards.push(obj);
                        }
                        break;
                    case 6:
                        result = BytesUtil.readByte1(bytes);
                        break;
                    default:
                        break;
                }
                break;
            case 0x26:
                rankType = BytesUtil.readByte1(bytes);
                if (rankType == 1) {
                    result = BytesUtil.readByte1(bytes);
                    switch (result) {
                        case 0:
                            town = BytesUtil.readByte1(bytes);
                            loc = bytes.readUnsignedShort();
                            break;
                        case 1:
                            flag = BytesUtil.readByte1(bytes);
                            leftTime = bytes.readUnsignedInt();
                            break;
                        default:
                            break;
                    }

                } else if (rankType == 2) {
                    dayNum = bytes.readUnsignedInt();
                    totalNum = bytes.readUnsignedInt();
                    getDayGift = BytesUtil.readByte1(bytes);
                    var flag:uint = BytesUtil.readByte1(bytes);
                    getTotal100Gift = LunaUtil.readBit(flag, 0);
                    getTotal200Gift = LunaUtil.readBit(flag, 1);
                    getTotal300Gift = LunaUtil.readBit(flag, 2);
                    acceptCount = BytesUtil.readByte1(bytes);
                }
                break;
            case 0x38:
                _kfType = BytesUtil.readByte1(bytes);
                switch (_kfType) {
                    case 0:
                        var _value = bytes.readUnsignedByte();
                        for (var i:int = 0; i < 8; i++) {
                            _sdRewardBits[i] = LunaUtil.readBit(_value, i);
                        }
                        _sdScore = bytes.readUnsignedInt();
                        _sdBegtime = bytes.readUnsignedInt();
                        var _sdLen = BytesUtil.readByte1(bytes);
                        _sdInfoData = [];
                        var data:SevendayStruct;
                        for (var i = 0; i < _sdLen; i++) {
                            data = new SevendayStruct();
                            data.eventId = bytes.readUnsignedShort();
                            data.state = bytes.readUnsignedInt();
                            _sdInfoData.push(data);
                        }
                        break;
                    case 1:
                        _rtype = BytesUtil.readByte1(bytes);
                        _rdata = new SevendayStruct();
                        if (_rtype == 1) {
                            var _value = bytes.readUnsignedByte();
                            for (var i:int = 0; i < 8; i++) {
                                _sdRewardBits[i] = LunaUtil.readBit(_value, i);
                            }
                            _sdScore = bytes.readUnsignedInt();
                            _sdBegtime = bytes.readUnsignedInt();
                        }
                        _rdata.eventId = bytes.readUnsignedShort();
                        _rdata.state = bytes.readUnsignedInt();
                        break;
                    case 2:
                        _danBegTime = bytes.readUnsignedInt();
                        _danEndTime = bytes.readUnsignedInt();
                        var _danLen:int = BytesUtil.readByte1(bytes);
                        _danInfoData = [];
                        var data:SevendayStruct;
                        for (var i = 0; i < _danLen; i++) {
                            data = new SevendayStruct();
                            data.eventId = bytes.readUnsignedShort();
                            data.state = bytes.readUnsignedInt();
                            _danInfoData.push(data);
                        }
                        break;
                    case 3:
                        _leiBegTime = bytes.readUnsignedInt();
                        _leiEndTime = bytes.readUnsignedInt();
                        var _leiLen:int = BytesUtil.readByte1(bytes);
                        _leiInfoData = [];
                        var data:SevendayStruct;
                        for (var i = 0; i < _leiLen; i++) {
                            data = new SevendayStruct();
                            data.eventId = bytes.readUnsignedShort();
                            data.state = bytes.readUnsignedInt();
                            _leiInfoData.push(data);
                        }
                        break;
                }
                break;
            case 0x39:
                rankType = BytesUtil.readByte1(bytes);
                var vo:LimitBuyVO
                switch (rankType) {
                    case 0x00:
                        limitStartTime = bytes.readUnsignedInt();
                        limitEndTime = bytes.readUnsignedInt();
                        acceptCount = BytesUtil.readByte1(bytes);
                        limtArr = []
                        for (var i:int = 0; i < acceptCount; i++) {
                            vo = parseLimitVO(bytes)
                            limtArr.push(vo)
                        }
                        break
                    case 0x01:
                        refreshLimitVO = parseLimitVO(bytes)
                        break
                }
                break
            case 0x40:
                _signday = BytesUtil.readByte1(bytes);
                _signbits = [];
                var _value = bytes.readUnsignedShort();
                for (var i:int = 0; i < 8; i++) {
                    _signbits.push(LunaUtil.readBit(_value, i));
                }
                break;
            case 0x91:
                Vip_super = getVIPVo(bytes,0);
                Vip_normal = getVIPVo(bytes,1);
                break;
            case 0x92:
                sharetime = bytes.readInt();
                concerntime = bytes.readInt();
                break;
            case 0x93:
                break;
            default:
                break;
        }
        return true;
    }

    public var Vip_super:NewVipVo;
    public var Vip_normal:NewVipVo;
    private function getVIPVo(byte:ByteArray,index:int):NewVipVo
    {
        var item:int;
        var num:int;
        var vo:NewVipVo = new NewVipVo();
        vo.totime = BytesUtil.readByte4(byte);
        vo.isget = BytesUtil.readByte1(byte);
        vo.rmb = BytesUtil.readByte2(byte);
        vo.goldnum = BytesUtil.readByte2(byte);
        vo.itemsize = BytesUtil.readByte1(byte);
        vo.items = [];
        for(var j:int=0;j<vo.itemsize;j++)
        {
            item =  BytesUtil.readByte4(byte);
            num =  BytesUtil.readByte2(byte);
            vo.items.push([item,num]);
        }
        vo.getVipDate(index);
        return vo;
    }

    public function get signday():int {
        return _signday;
    }

    public function get signbits():Array {
        return _signbits;
    }

    private function parseLimitVO(bytes:ByteArray):LimitBuyVO {
        var vo:LimitBuyVO = new LimitBuyVO()
        vo.index = BytesUtil.readByte1(bytes);
        vo.itemId = BytesUtil.readByte2(bytes);
        vo.count = BytesUtil.readByte1(bytes);
        vo.discountPrice = BytesUtil.readByte2(bytes);
        vo.originPrice = BytesUtil.readByte2(bytes);
        vo.viplv = BytesUtil.readByte1(bytes);
        return vo;
    }

    public function get kfType():int {
        return _kfType;
    }

    public function get sdScore():int {
        return _sdScore;
    }

    public function get sdBegtime():int {
        return _sdBegtime;
    }

    public function get sdRerwardData():Array {
        return _sdRewardBits as Array;
    }

    public function get sdInfoData():Array {
        return _sdInfoData;
    }

    public function get rtype():int {
        return _rtype;
    }

    public function get rdata():SevendayStruct {
        return _rdata;
    }

    public function get danBegTime():int {
        return _danBegTime;
    }

    public function get danEndTime():int {
        return _danEndTime;
    }

    public function get danInfoData():Array {
        return _danInfoData;
    }

    public function get leiBegTime():int {
        return _leiBegTime;
    }

    public function get leiEndTime():int {
        return _leiEndTime;
    }

    public function get leiInfoData():Array {
        return _leiInfoData;
    }

    public function get type():uint {
        return _type;
    }

    public function get sevenLoveType():uint {
        return _sevenLoveType;
    }

    public function get slLoverArr():Array {
        return _slLoverArr;

    }

    public function get sltype():uint {
        return _sltype;
    }

    public function get sllover():String {
        return _sllover;
    }

    public function get slbind():uint {
        return _slbind;
    }

    public function get slpos():uint {
        return _slpos;
    }

    public function get slevent():uint {
        return _slevent;
    }

    public function get slscore():uint {
        return _slscore;
    }

    public function get slplace():uint {
        return _slplace;
    }

    public function get slcount():uint {
        return _slcount;
    }

    public function get slSetLover():uint {
        return _slSetLover;
    }

    public function get slrankNum():int {
        return _slrankNum;
    }


}
}