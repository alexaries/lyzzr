package net.data.recvMsg.sWar {
import com.hurlant.math.BigInteger;

import laya.utils.Dictionary;

import utils.LunaUtil;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.sWar.SwarTeamMemberStruct;
import net.data.structs.sWar.SwarTeamSkillStruct;
import net.utils.BytesUtil;

/**
 * 0xE8
 * @author ryan
 */
public class SWarOperMsg extends BaseMsg {
    public var operation:uint;
    public var result:uint;
    /**
     * 投注时段<br>
     * 0 - 投注阶段1 入围赛<br>
     * 1 - 投注阶段2 32强<br>
     * 2 - 投注阶段3 8强1<br>
     * 3 - 投注阶段4 8强2<br>
     * 4 - 投注阶段5 4强<br>
     * 5 - 投注阶段6 2强<br>
     * 6 - 投注阶段7 1强<br>
     * */
    public var state:uint;
    public var position:uint;
    public var group:uint;
    public var fightID:BigInteger;
    public var teamId:BigInteger;
    public var teamName:String;
    public var teamScore:uint;
    public var leaderId:BigInteger;
    public var inWar:uint;
    public var skillNum:int;
    public var teamCount:int;
    public var skillData:Array;
    public var noTeam:Boolean = false;
    public var memberList:Vector.<SwarTeamMemberStruct>;
    public var guwuLevel:int;

    public var lastRank_type:int;//0天榜 1 地榜
    public var lastRank:int;

    public var bestRank_type:int;//0天榜 1 地榜
    public var bestRank:int;
    public var canbaiType:int;

    public var list_all_len:int;
    public var idIndex:int;
    public var teamListArr:Array;
    public var applyListArr:Array;
    private var type:int;
    public var skillDic:Dictionary;

    public function SWarOperMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            operation = BytesUtil.readByte1(bytes);
            var idBytes:ByteArray;
            switch (operation) {
                case 0:
                    result = BytesUtil.readByte1(bytes);
                    result = result & 0x0f;
                    break;
                case 1:
                case 3:
                case 4:
                    result = BytesUtil.readByte1(bytes);
                    break;
                case 2:
                    result = BytesUtil.readByte1(bytes);
                    state = BytesUtil.readByte1(bytes);
                    if (state < 2) {
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        fightID = BytesUtil.readUint64(idBytes);
                    } else {
                        position = BytesUtil.readByte2(bytes);
                        group = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 5:
                    noTeam = false;
                    parseTeamData(bytes);
                    break;
                case 6://离开,解散
                    noTeam = true;
                    break;
                case 7://更换队长
                    var idBytes0:ByteArray = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes0, 0, 8);
                    leaderId = BytesUtil.readUint64(idBytes0);
                    break;
                case 8://技能升级
                    var sid:int;
                    var svo:SwarTeamSkillStruct = new SwarTeamSkillStruct();
                    svo.sid = BytesUtil.readByte1(bytes);
                    svo.currentLevel = BytesUtil.readByte1(bytes);
                    svo.hasDonateNum = bytes.readUnsignedInt();
                    skillDic.set(sid, svo);
                    break;
                case 9://更新出战顺序
                    parseMemberData(bytes);
                    break;
                case 10:
                    noTeam = false;
                    break;
                case 11:
                    canbaiType = BytesUtil.readByte1(bytes);
                    break;
                case 12:
                    noTeam = true;
                    break;
                case 13:
                    result = BytesUtil.readByte1(bytes);
                    break;
                case 14:
                    result = BytesUtil.readByte1(bytes);
                    state = BytesUtil.readByte1(bytes);
                    if (state == 0) {
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        fightID = BytesUtil.readUint64(idBytes);
                    } else {
                        position = BytesUtil.readByte2(bytes);
                        group = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 15:
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    fightID = BytesUtil.readUint64(idBytes);
                    guwuLevel = BytesUtil.readByte1(bytes);
                    break;
                case 16:
                    result = BytesUtil.readByte1(bytes);
                    break;
                case 17:
                    list_all_len = BytesUtil.readByte2(bytes);
                    idIndex = BytesUtil.readByte2(bytes);
                    parseOtherTeamData(bytes);
                    break;
                case 18:
                    applyListArr = [];
                    result = BytesUtil.readByte1(bytes);
                    //1新增列表(有申请消息时  主动发送  每次1条);//0初始列表
                    applyListArr = parseApplyList(bytes);
                    break;
                case 19:
                    type = BytesUtil.readByte1(bytes);
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    fightID = BytesUtil.readUint64(idBytes);
                    if (type == 0) {//0同意 1拒绝
                        result = BytesUtil.readByte1(bytes);
                    }
                    break;
                default:
                    break;
            }
        } catch (error:*) {
        }
        return true;
    }

    private function parseTeamData(bytes:ByteArray):void {
        noTeam = false;
        var idBytes0:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes0, 0, 8);
        teamId = BytesUtil.readUint64(idBytes0);//bytes.readUnsignedInt();
        teamName = BytesUtil.readUserName(bytes);
        teamScore = bytes.readUnsignedInt();
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        leaderId = BytesUtil.readUint64(idBytes);
        inWar = BytesUtil.readByte1(bytes);
        guwuLevel = BytesUtil.readByte1(bytes);
        var a:int = BytesUtil.readByte1(bytes);
        lastRank_type =  (LunaUtil.readBit(a, 0)?1:0);//1
        lastRank = parseRank(a);

        var b:int = BytesUtil.readByte1(bytes);
        bestRank_type =  (LunaUtil.readBit(b, 0)?1:0);
        bestRank = parseRank(b);

        skillNum = BytesUtil.readByte1(bytes);
        var sid:int;
        var svo:SwarTeamSkillStruct
        for (var i:int = 0; i < skillNum; i++) {
            sid = BytesUtil.readByte1(bytes);
            svo = skillDic.get(sid) as SwarTeamSkillStruct;
            svo.currentLevel = BytesUtil.readByte1(bytes);
            svo.hasDonateNum = bytes.readUnsignedInt();
            skillDic.set(sid,svo);
        }

        parseMemberData(bytes);
    }

    private function parseMemberData(bytes:ByteArray):void {

        memberList = new Vector.<SwarTeamMemberStruct>;
        var membervo:SwarTeamMemberStruct;
        teamCount = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < teamCount; i++) {
            membervo = new SwarTeamMemberStruct();
            var idBytes:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            membervo.id = BytesUtil.readUint64(idBytes);
            if (membervo.id.equals(leaderId)) {
                membervo.post = 1;
            } else {
                membervo.post = 2;
            }
            membervo.name = BytesUtil.readUserName(bytes);
            var tempbyte:int = 0;
            tempbyte = BytesUtil.readByte1(bytes);
            membervo.imgID = tempbyte;
            membervo.battleFlag = BytesUtil.readByte1(bytes);
            membervo.score = bytes.readUnsignedInt();
            membervo.level = BytesUtil.readByte1(bytes);
            membervo.power = bytes.readUnsignedInt();
            memberList.push(membervo);
        }

    }

    private function parseOtherTeamData(bytes:ByteArray):void {
        var len:int = BytesUtil.readByte1(bytes);
        var obj:Object;
        teamListArr = []
        for (var i:int = 0; i < len; i++) {
            obj = {};
            obj.teamName = BytesUtil.readUserName(bytes);
            obj.level = BytesUtil.readByte1(bytes);
            obj.count = BytesUtil.readByte1(bytes);
            obj.leaderName = BytesUtil.readUserName(bytes);
            obj.memberList = [];
            for (var j:int = 0; j < obj.count; j++) {
                var memberObj:Object = {};
                memberObj.imgId = BytesUtil.readByte1(bytes);
                memberObj.name = BytesUtil.readUserName(bytes);
                memberObj.country = BytesUtil.readByte1(bytes);
                memberObj.power = bytes.readUnsignedInt();
                memberObj.post = 0;
                if (memberObj.name == obj.leaderName) {
                    memberObj.post = 1;
                }
                obj.memberList.push(memberObj);
            }
            teamListArr.push(obj);
        }
    }

    private function parseRank(a:int):int {
        if (LunaUtil.readBit(a, 1)) {
            return 32;
        } else if (LunaUtil.readBit(a, 2)) {
            return 16;
        } else if (LunaUtil.readBit(a, 3)) {
            return 8;
        } else if (LunaUtil.readBit(a, 4)) {
            return 4;
        } else if (LunaUtil.readBit(a, 5)) {
            return 2;
        } else if (LunaUtil.readBit(a, 6)) {
            return 1;
        }
        return 0;
    }

    private function parseApplyList(bytes:ByteArray):Array {
        var len:int = BytesUtil.readByte1(bytes);
        var arr:Array = [];
        var obj:Object
        for (var i:int = 0; i < len; i++) {
            obj = {};
            var idBytes:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            obj.id = BytesUtil.readUint64(idBytes);
            obj.name = BytesUtil.readUserName(bytes);
            obj.level = BytesUtil.readByte1(bytes);
            obj.applyTime = bytes.readUnsignedInt();
            arr.push(obj)
        }
        return arr;
    }
}
}
