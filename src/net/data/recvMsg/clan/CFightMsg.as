package net.data.recvMsg.clan {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.CFPlayerStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CFightMsg extends BaseMsg {
    private var _type:uint;
    public var status:uint;
    public var time:uint;
    private var _itemList:Array;
    public var skillItem:Object;
    private var _dstCName:String;
    private var _myscore:uint;
    private var _dstsocre:uint;
    private var _ldata:Array;
    private var _rdata:Array;
    private var idBytes:ByteArray;
    public var flag:uint;
    public var playerStruct:Object;
    public var pid:BigInteger;
    public var state:uint;
    public var skillId:uint;
    public var fightid:uint;
    public var extscore:uint;
    public var leftTime:uint;
    public var skillFlags:uint;

    public var reportList:Array;

    public function CFightMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int = 0;
            var i:int;
            switch (_type) {
                case 0:
                    status = BytesUtil.readByte1(bytes);
                    time = bytes.readUnsignedInt();
                    _dstCName = BytesUtil.readUserName(bytes);
                    break;
                case 1:
                    //本回合已使用技能列表
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    pid = BytesUtil.readUint64(idBytes);
                    skillFlags = BytesUtil.readByte2(bytes);
                    _itemList = formatSkillData(skillFlags);
                    break;
                case 2:
                    //准备阶段 玩家列表
                    _itemList = [];
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        var pData:Object = new Object();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        pData.pid = BytesUtil.readUint64(idBytes);
                        pData.pname = BytesUtil.readUserName(bytes);
                        pData.level = BytesUtil.readByte1(bytes);
                        pData.fightID = BytesUtil.readByte1(bytes);
                        pData.status = BytesUtil.readByte1(bytes);
                        skillFlags = BytesUtil.readByte2(bytes);
                        pData.skillData = formatSkillData(skillFlags);
                        _itemList.push(pData);
                    }
                    break;
                case 3:
                    //准备阶段 玩家列表 位置改变
                    _itemList = [];
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        var pchangeData:Object = new Object();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        pchangeData.pid = BytesUtil.readUint64(idBytes);
                        pchangeData.fightID = BytesUtil.readByte1(bytes);
                        pchangeData.pos = BytesUtil.readByte1(bytes);
                        _itemList.push(pchangeData);
                    }
                    break;
                case 4:
                    //使用技能
                    skillId = BytesUtil.readByte1(bytes);
                    break;
                case 5:
                    flag = BytesUtil.readByte1(bytes);
                    _myscore = bytes.readUnsignedInt();
                    _dstsocre = bytes.readUnsignedInt();
                    extscore = bytes.readUnsignedInt();
                    //胜负
                    _itemList = [];
                    for (i = 0; i < 6; i++) {
                        _itemList.push(BytesUtil.readByte1(bytes));
                    }
                    _ldata = [];
                    _rdata = [];
                    var llen:int = BytesUtil.readByte1(bytes);
                    var pStruct:CFPlayerStruct;
                    for (i = 0; i < llen; i++) {
                        pStruct = new CFPlayerStruct();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        pStruct.pid = BytesUtil.readUint64(idBytes);
                        pStruct.playerHead = BytesUtil.readByte2(bytes);
                        pStruct.pname = BytesUtil.readUserName(bytes);
                        pStruct.level = BytesUtil.readByte1(bytes);
                        pStruct.fightID = BytesUtil.readByte1(bytes);
                        pStruct.status = BytesUtil.readByte1(bytes);
                        _ldata.push(pStruct);
                    }
                    var rlen:int = BytesUtil.readByte1(bytes);
                    for (i = 0; i < rlen; i++) {
                        pStruct = new CFPlayerStruct();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        pStruct.pid = BytesUtil.readUint64(idBytes);
                        pStruct.playerHead = BytesUtil.readByte2(bytes);
                        pStruct.pname = BytesUtil.readUserName(bytes);
                        pStruct.level = BytesUtil.readByte1(bytes);
                        pStruct.fightID = BytesUtil.readByte1(bytes);
                        pStruct.status = BytesUtil.readByte1(bytes);
                        _rdata.push(pStruct);
                    }
                    break;
                case 6:
                    //状态改变数据
                    _itemList = [];
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        var cData:Object = new Object();
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        cData.pid = BytesUtil.readUint64(idBytes);
                        cData.status = BytesUtil.readByte1(bytes);
                        itemList.push(cData);
                    }
                    break;
                case 7:
                    //准备阶段 玩家进入 和 离开
                    flag = BytesUtil.readByte1(bytes);
                    playerStruct = new Object();
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    playerStruct.pid = BytesUtil.readUint64(idBytes);
                    switch (flag) {
                        case 0:
                            playerStruct.pname = BytesUtil.readUserName(bytes);
                            playerStruct.level = BytesUtil.readByte1(bytes);
                            playerStruct.fightID = BytesUtil.readByte1(bytes);
                            playerStruct.status = BytesUtil.readByte1(bytes);
                            break;
                        default:
                    }
                    break;
                case 8:
                    //删除角色  战斗界面的时候
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    pid = BytesUtil.readUint64(idBytes);
                    break;
                case 9:
                    //准备阶段 角色信息修改
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    pid = BytesUtil.readUint64(idBytes);
                    state = BytesUtil.readByte1(bytes);
                    break;
                case 10:
                    fightid = BytesUtil.readByte1(bytes);
                    leftTime = BytesUtil.readByte1(bytes);
                    len = BytesUtil.readByte1(bytes);
                    reportList = [];
                    for (i = 0; i < len; i++) {
                        var reportData:Object = new Object();
                        reportData.res = BytesUtil.readByte1(bytes);
                        reportData.player1 = BytesUtil.readUserName(bytes);
                        reportData.player2 = BytesUtil.readUserName(bytes);
                        reportData.reportid = bytes.readUnsignedInt();
                        reportList.push(reportData);
                    }
                    break;
                case 11:
                    flag = BytesUtil.readByte1(bytes);
                    fightid = BytesUtil.readByte1(bytes);
                    _myscore = bytes.readUnsignedInt();
                    _dstsocre = bytes.readUnsignedInt();
                    extscore = bytes.readUnsignedInt();
                    break;
                case 12:
                    _myscore = bytes.readUnsignedInt();
                    _dstsocre = bytes.readUnsignedInt();
                    break;
                default:
            }
        } catch (e:*) {

        }
        return true;
    }

    public function get itemList():Array {
        return _itemList;
    }

    public function get type():uint {
        return _type;
    }

    public function get ldata():Array {
        return _ldata;
    }

    public function get rdata():Array {
        return _rdata;
    }

    public function get myscore():uint {
        return _myscore;
    }

    public function get dstCName():String {
        return _dstCName;
    }

    public function get dstsocre():uint {
        return _dstsocre;
    }

    public function formatSkillData(flag:int):Array {
        var itemList:Array = [];
        for (var j:int = 0; j < 16; j++) {
            if (flag & (0x01 << j)) {
                itemList.push(j);
            }
        }
        return itemList;
    }
}
}
