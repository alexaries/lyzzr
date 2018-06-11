package net.data.recvMsg.heroIsland {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.heroIsland.HeroIslandRankStruct;
import net.data.structs.heroIsland.HeroIslandUserStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class HeroIslandDataMsg extends BaseMsg {

    private var _type:uint;
    private var _isIn:uint;
    private var _status:uint;
    private var _locID:uint;
    private var _freakKill:uint;
    private var _status1:uint;
    private var _status2:uint;
    private var _status3:uint;
    private var _taskProcess:uint;
    private var _result:uint;
    private var _playerList:Array;
    private var idBytes:ByteArray;
    private var _oType:uint;

    public var sstruct:HeroIslandUserStruct;
    private var _itemList:Array;

    public var npcData:Object;
    public var skillData:Object;
    private var _hasReward:uint;
    private var _all_len:uint;
    private var _idx:uint;
    private var _rank:uint;
    private var _point:uint;
    private var _currTime:uint;
    private var _startTime:uint;
    private var _endTime:uint;

    private var _autofight:uint;
    private var _fightcfg:String;

    public function HeroIslandDataMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int;
            switch (_type) {
                case 0:
                    _isIn = BytesUtil.readByte1(bytes);
                    _currTime = bytes.readUnsignedInt();
                    _startTime = bytes.readUnsignedInt();
                    _endTime = bytes.readUnsignedInt();
                    _status = BytesUtil.readByte1(bytes);
                    /**在英雄岛内部*/
                    if (_isIn == 1) {
                        _locID = BytesUtil.readByte1(bytes);
                        _freakKill = BytesUtil.readByte1(bytes);
                        _status1 = BytesUtil.readByte1(bytes);
                        _status2 = BytesUtil.readByte1(bytes);
                        _status3 = BytesUtil.readByte1(bytes);
                        _taskProcess = BytesUtil.readByte1(bytes);
                        _hasReward = BytesUtil.readByte1(bytes);
                        _rank = BytesUtil.readByte1(bytes);
                        _point = BytesUtil.readByte2(bytes);
                        _autofight = BytesUtil.readByte1(bytes);
                        //_autofight = 0;
                    }
                    break;
                case 1:
                    _result = BytesUtil.readByte1(bytes);
                    if (!_result) {
                        _currTime = bytes.readUnsignedInt();
                        _startTime = bytes.readUnsignedInt();
                        _endTime = bytes.readUnsignedInt();
                    }
                    break;
                case 2:
                    _status = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    _status = BytesUtil.readByte1(bytes);
                    break;
                case 4:
                    _locID = BytesUtil.readByte1(bytes);
                    break;
                case 5:
                    _taskProcess = BytesUtil.readByte1(bytes);
                    _freakKill = BytesUtil.readByte1(bytes);
                    if (_taskProcess == 3) {
                        _hasReward = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 6:
                    len = BytesUtil.readByte2(bytes);
                    _playerList = [];
                    for (i = 0; i < len; i++) {
                        var struct:HeroIslandUserStruct = new HeroIslandUserStruct();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        struct.id = BytesUtil.readUint64(idBytes);
                        struct.status = BytesUtil.readByte1(bytes);
                        struct.leftHp = BytesUtil.readByte1(bytes);
                        struct.level = BytesUtil.readByte1(bytes);
                        struct.name = BytesUtil.readUserName(bytes);
                        var index:int = findPlayerIn(struct, _playerList);
                        if (index > -1)
                            continue;
                        _playerList.push(struct);
                    }
                    break;
                case 7:
                    _oType = BytesUtil.readByte1(bytes);
                    switch (_oType) {
                        case 0:
                            sstruct = new HeroIslandUserStruct();
                            idBytes = BytesUtil.creatByteArray();
                            bytes.readBytes(idBytes, 0, 8);
                            sstruct.id = BytesUtil.readUint64(idBytes);
                            sstruct.status = BytesUtil.readByte1(bytes);
                            sstruct.leftHp = BytesUtil.readByte1(bytes);
                            sstruct.level = BytesUtil.readByte1(bytes);
                            sstruct.name = BytesUtil.readUserName(bytes);
                            break;
                        case 1:
                            sstruct = new HeroIslandUserStruct();
                            idBytes = BytesUtil.creatByteArray();
                            bytes.readBytes(idBytes, 0, 8);
                            sstruct.id = BytesUtil.readUint64(idBytes);
                            break;
                        case 2:
                            sstruct = new HeroIslandUserStruct();
                            idBytes = BytesUtil.creatByteArray();
                            bytes.readBytes(idBytes, 0, 8);
                            sstruct.id = BytesUtil.readUint64(idBytes);
                            sstruct.leftHp = BytesUtil.readByte1(bytes);
                            break;
                        default:
                    }
                    break;
                case 8:
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        var itemData:Object = new Object();
                        itemData.id = BytesUtil.readByte2(bytes);
                        itemData.num = bytes.readUnsignedInt();
                        _itemList.push(itemData);
                    }
                    break;
                case 9:
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        npcData = new Object();
                        npcData.id = BytesUtil.readByte2(bytes);
                        npcData.leftTime = BytesUtil.readByte2(bytes);
                        _itemList.push(npcData);
                    }
                    break;
                case 10:
                    npcData = new Object();
                    npcData.id = BytesUtil.readByte2(bytes);
                    npcData.leftTime = BytesUtil.readByte2(bytes);
                    break;
                case 11:
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        skillData = new Object();
                        skillData.id = BytesUtil.readByte1(bytes);
                        skillData.leftTime = BytesUtil.readByte2(bytes);
                        _itemList.push(skillData);
                    }
                    break;
                case 12:
                    skillData = new Object();
                    skillData.id = BytesUtil.readByte1(bytes);
                    skillData.leftTime = BytesUtil.readByte2(bytes);
                    break;
                case 13:
                    _idx = BytesUtil.readByte2(bytes);
                    _all_len = BytesUtil.readByte2(bytes);
                    len = BytesUtil.readByte1(bytes);
                    var rankvo:HeroIslandRankStruct;
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        rankvo = new HeroIslandRankStruct();
                        rankvo.rank = _idx + i + 1;
                        rankvo.name = BytesUtil.readUserName(bytes);
                        rankvo.level = BytesUtil.readByte1(bytes);
                        rankvo.points = BytesUtil.readByte2(bytes);
                        _itemList.push(rankvo);
                    }
                    break;
                case 14:
                    _rank = BytesUtil.readByte1(bytes);
                    _point = BytesUtil.readByte2(bytes);
                    break;
                case 15:
                    _currTime = bytes.readUnsignedInt();
                    _startTime = bytes.readUnsignedInt();
                    _endTime = bytes.readUnsignedInt();
                    break;
                case 16:
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        var mapData:Object = new Object();
                        mapData.id = BytesUtil.readByte1(bytes);
                        mapData.num = BytesUtil.readByte2(bytes);
                        _itemList.push(mapData);
                    }
                    break;
                case 17:
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        var expData:Object = new Object();
                        expData.id = BytesUtil.readByte1(bytes);
                        expData.num = BytesUtil.readByte1(bytes);
                        _itemList.push(expData);
                    }
                    break;
                case 18:
                    _fightcfg = bytes.readUTF();
                    break;
                case 19:
                    //_rank = BytesUtil.readByte2(bytes);
                    //_point = BytesUtil.readByte2(bytes);
                    len = BytesUtil.readByte1(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        var rankData:Object = new Object();
                        rankData.name = BytesUtil.readUserName(bytes);
                        rankData.score = BytesUtil.readByte2(bytes);
                        _itemList.push(rankData);
                    }
                    break;
                case 20:
                    _autofight = BytesUtil.readByte1(bytes);
                    break;
                default:
            }
        }
        catch (e:*) {

        }
        return true;
    }

    private function findPlayerIn(s:HeroIslandUserStruct, arr:Array):int {
        if (!arr)
            arr = [];
        for (var i:int = 0; i < arr.length; i++) {
            var tt:HeroIslandUserStruct = arr[i] as HeroIslandUserStruct;
            if (tt.id.equals(s.id) || tt.name == s.name) {
                return i;
            }
        }
        return -1;
    }

    public function get type():uint {
        return _type;
    }

    public function get isIn():uint {
        return _isIn;
    }

    public function get status():uint {
        return _status;
    }

    public function get locID():uint {
        return _locID;
    }

    public function get freakKill():uint {
        return _freakKill;
    }

    public function get status1():uint {
        return _status1;
    }

    public function get status2():uint {
        return _status2;
    }

    public function get status3():uint {
        return _status3;
    }

    public function get taskProcess():uint {
        return _taskProcess;
    }

    public function get result():uint {
        return _result;
    }

    public function get playerList():Array {
        return _playerList;
    }

    public function get oType():uint {
        return _oType;
    }

    public function get itemList():Array {
        return _itemList;
    }

    public function get hasReward():uint {
        return _hasReward;
    }

    public function get rank():uint {
        return _rank;
    }

    public function get point():uint {
        return _point;
    }

    public function get all_len():uint {
        return _all_len;
    }

    public function get idx():uint {
        return _idx;
    }

    public function get currTime():uint {
        return _currTime;
    }

    public function get startTime():uint {
        return _startTime;
    }

    public function get endTime():uint {
        return _endTime;
    }

    /**
     * 是否自动战斗
     */
    public function get autofight():uint {
        return _autofight;
    }

    /**
     * 自动战斗配置
     */
    public function get fightcfg():String {
        return _fightcfg;
    }

}
}
