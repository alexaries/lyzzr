package net.data.recvMsg.sWar {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.sWar.BTMemberStruct;
import net.data.structs.sWar.BattleTeamStruct;
import net.data.structs.sWar.SWarBetStruct;
import net.data.structs.sWar.SWarP1Struct;
import net.data.structs.sWar.SWarReportDataStruct;
import net.data.structs.sWar.SWarResultStruct;
import net.data.structs.sWar.TeamResultStruct;
import net.data.structs.sWar.TeamWarReportStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class SWarMsg extends BaseMsg {
    /**
     * 操作类型<br>
     * 0 - 状态信息<br>
     * 1 - 报名状态信息<br>
     * 2 - 入围赛信息<br>
     * 3 - 32强赛信息<br>
     * 4 - 8强赛<br>
     * 5 - 4强赛<br>
     * 6 - 半决赛<br>
     * 7 - 决赛<br>
     * 8 - 更新信息<br>
     */
    public var type:uint;
    /**
     * 当前届数
     */
    public var session:uint;
    public var sessionState:uint;
    public var isIn:uint;
    /**
     * 距离报名结束时间
     */
    public var time:uint;
    public var pNums:uint;
    public var flag:uint;
    public var datas:Array;
    public var betInfoDatas:Array;
    public var pdatas:Array;
    public var leftSupport:uint;
    public var winNum:uint;
    public var round:uint;
    public var isUpState:uint;
    public var isMerge:Boolean;
    public var state:uint;
    public var startID:uint;
    public var all_len:uint;
    public var myTeamName:String;
    public var myTeamLv:uint;

    public function SWarMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        //	try {
        type = BytesUtil.readByte1(bytes);
        var len:int = 0;
        var i:int = 0;
        var p1:SWarP1Struct;
        var report:SWarReportDataStruct;
        var result:SWarResultStruct;
        datas = [];
        betInfoDatas = [];
        pdatas = [];
        switch (type) {
            case 0:
                session = BytesUtil.readByte2(bytes);
                sessionState = BytesUtil.readByte1(bytes);
                isIn = BytesUtil.readByte1(bytes);
                isUpState = BytesUtil.readByte1(bytes);
                if (bytes.length > bytes.position)
                    isMerge = bytes.readBoolean();
                break;
            case 1:
                isIn = BytesUtil.readByte1(bytes);
                time = bytes.readUnsignedInt();
                pNums = BytesUtil.readByte2(bytes);
                break;
            case 2:
            case 3:
                flag = BytesUtil.readByte1(bytes);
                switch (flag) {
                    case 0:
                        time = bytes.readUnsignedInt();
                        len = BytesUtil.readByte1(bytes);
                        for (i = 0; i < len; i++) {
                            report = readReportData(bytes);
                            report.btimes = i + 1;
                            datas.push(report);
                        }
                        break;
                    case 1:
                        leftSupport = BytesUtil.readByte1(bytes);
                        winNum = BytesUtil.readByte2(bytes);
                        all_len = BytesUtil.readByte2(bytes);
                        startID = BytesUtil.readByte2(bytes);
                        len = BytesUtil.readByte1(bytes);
                        for (i = 0; i < len; i++) {
                            p1 = readP1Data(bytes);
                            p1.pos = i + startID;
                            datas.push(p1);
                        }
                        break;
                    default:
                }
                break;
            case 4:
            case 5:
            case 6:
            case 7:
                flag = BytesUtil.readByte1(bytes);
                if (flag < 0x80) {
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        betInfoDatas.push(readBetInfoData(bytes));
                    }
                    len = 8;
                    if (type == 4)
                        len = 32;
                    for (i = 0; i < len; i++) {
                        p1 = readP2Data(bytes);
                        p1.pos = i;
                        p1.group = flag;
                        pdatas.push(p1);
                    }
                }
                round = BytesUtil.readByte1(bytes);
                switch (round) {
                    case 0:
                        len = 0;
                        break;
                    case 1:
                        len = 16;
                        break;
                    case 2:
                        len = 24;
                        break;
                    case 3:
                        len = 4;
                        break;
                    case 4:
                        len = 6;
                        break;
                    case 5:
                        len = 7;
                        break;
                }
                for (i = 0; i < len; i++) {
                    result = readResult(bytes);
                    datas.push(result);
                }
                break;
            case 8:
                flag = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                break;
            default:
        }
        if (type >= 10) {
            readTeamWar(bytes);
        }
        return true;
    }

    private function readBetInfoData(bytes:ByteArray):* {
        var report:SWarBetStruct = new SWarBetStruct();
        var tempbyte:int = BytesUtil.readByte1(bytes);
        report.round = tempbyte & 0x07;
        report.pos = (tempbyte >> 3) & 0x3f;
        report.tael = BytesUtil.readByte1(bytes);
        return report;
    }

    private function readResult(bytes:ByteArray):SWarResultStruct {
        var resultStruct:SWarResultStruct = new SWarResultStruct();

        var results:Array = [];
        var resultIDs:Array = [];
        var len:int = BytesUtil.readByte1(bytes);
        var tempbyte:int = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < len; i++) {
            results.push((tempbyte >> i) & 0x01);
            resultIDs.push(bytes.readUnsignedInt());
        }
        resultStruct.wins = results;
        resultStruct.battleIds = resultIDs;
        return resultStruct;
    }

    private function readP1Data(bytes:ByteArray):* {
        var report:SWarP1Struct = new SWarP1Struct();
        var tempbyte:int = 0;
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        report.fightID = BytesUtil.readUint64(idBytes);
        report.flv = bytes.readUnsignedInt();
        report.fpop = BytesUtil.readByte2(bytes);
        report.tael = BytesUtil.readByte1(bytes);
        tempbyte = BytesUtil.readByte1(bytes);
        report.portrait = tempbyte & 0x07;
        report.color = (tempbyte >> 3) & 0x07;
        report.countryID = (tempbyte >> 6) & 0x03;
        report.lv = BytesUtil.readByte1(bytes);
        report.fightName = BytesUtil.readUserName(bytes);
        return report;
    }

    private function readP2Data(bytes:ByteArray):* {
        var report:SWarP1Struct = new SWarP1Struct();
        var tempbyte:int = 0;
        tempbyte = BytesUtil.readByte1(bytes);
        report.portrait = tempbyte & 0x0F;
        report.color = (tempbyte >> 3) & 0x07;
        report.countryID = (tempbyte >> 6) & 0x03;
        report.lv = BytesUtil.readByte1(bytes);
        report.flv = bytes.readUnsignedInt();
        report.fpop = BytesUtil.readByte2(bytes);
        // var idBytes:ByteArray = BytesUtil.creatByteArray();
        // bytes.readBytes(idBytes,0,8);
        // report.fightID = BytesUtil.readUint64(idBytes);
        report.fightName = BytesUtil.readUserName(bytes);
        return report;
    }

    private function readReportData(bytes:ByteArray):* {
        var report:SWarReportDataStruct = new SWarReportDataStruct();
        var tempbyte:int = BytesUtil.readByte1(bytes);
        report.result = tempbyte & 0x0f;
        report.bflag = (tempbyte >> 4) & 0x0f;
        tempbyte = BytesUtil.readByte1(bytes);
        report.portrait = tempbyte & 0x07;
        report.color = (tempbyte >> 3) & 0x07;
        report.countryID = (tempbyte >> 6) & 0x03;
        report.reportID = bytes.readUnsignedInt();
        // report.lv = BytesUtil.readByte1(bytes);
        report.fightName = BytesUtil.readUserName(bytes);
        return report;
    }


    private function readTeamWar(bytes:ByteArray):void {
        var len:int = 0;
        var i:int = 0;
        var team:BattleTeamStruct;
        var p1:SWarP1Struct;
        var report:TeamWarReportStruct;
        var result:TeamResultStruct;
        datas = [];
        betInfoDatas = [];
        pdatas = [];
        switch (type) {
            case 10:
                session = BytesUtil.readByte2(bytes);
                sessionState = BytesUtil.readByte1(bytes);
                isIn = BytesUtil.readByte1(bytes);
                isUpState = BytesUtil.readByte1(bytes);
                break;
            case 11:
                isIn = BytesUtil.readByte1(bytes);
                time = bytes.readUnsignedInt();
                pNums = BytesUtil.readByte2(bytes);
                break;
            case 12:
                flag = BytesUtil.readByte1(bytes);
                switch (flag) {
                    case 0:
                        time = bytes.readUnsignedInt();
                        myTeamName = BytesUtil.readUserName(bytes);
                        myTeamLv = BytesUtil.readByte1(bytes);
                        len = BytesUtil.readByte1(bytes);
                        for (i = 0; i < len; i++) {
                            report = readTeamWarReportDataMore(bytes);
                            report.btimes = i + 1;
                            datas.push(report);
                        }
                        break;
                    case 1:
                        leftSupport = BytesUtil.readByte1(bytes);
                        winNum = BytesUtil.readByte2(bytes);
                        all_len = BytesUtil.readByte2(bytes);
                        startID = BytesUtil.readByte2(bytes);
                        len = BytesUtil.readByte1(bytes);
                        for (i = 0; i < len; i++) {
                            p1 = readTeamData(bytes);
                            p1.pos = i + startID;
                            datas.push(p1);
                        }
                        break;
                    default:
                }
                break;
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
                flag = BytesUtil.readByte1(bytes);
                if (flag < 0x80) {
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        betInfoDatas.push(readBetInfoData(bytes));
                    }
                    len = 8;
                    if (type == 13)
                        len = 32;
                    else if (type == 14)
                        len = 16;
                    for (i = 0; i < len; i++) {
                        team = readTeamData2(bytes);
                        team.pos = i;
                        team.group = flag;
                        pdatas.push(team);
                    }
                }
                round = BytesUtil.readByte1(bytes);
                switch (round) {
                    case 0:
                        len = 0;
                        break;
                    case 1:
                        len = 16;
                        break;
                    case 2:
                        len = 8;
                        break;
                    case 3:
                        len = 4;
                        break;
                    case 4:
                        len = 6;
                        break;
                    case 5:
                        len = 7;
                        break;
                }
                for (i = 0; i < len; i++) {
                    result = readTeamWarResult(bytes);
                    datas.push(result);
                }
                break;
            case 18:
                flag = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                break;
            default:
        }
    }

    private function readTeamWarReportDataMore(bytes:ByteArray):TeamWarReportStruct {
        var report:TeamWarReportStruct = new TeamWarReportStruct();
        report.result = BytesUtil.readByte1(bytes);
        report.fightName = BytesUtil.readUserName(bytes);
        var i:int;
        for (i = 0; i < 6; i++) {
            var member:BTMemberStruct = new BTMemberStruct;
            member.name = BytesUtil.readUserName(bytes);
            member.flag = BytesUtil.readByte1(bytes);
            member.imgID = BytesUtil.readByte1(bytes);
            member.power = bytes.readUnsignedInt();
            report.battlers[i] = member;
        }
        var winData:int = BytesUtil.readByte1(bytes);
        report.wins[0] = winData & 1;
        report.wins[1] = winData >> 1 & 1;
        report.wins[2] = winData >> 2 & 1;

        report.ids.push(bytes.readUnsignedInt());
        report.ids.push(bytes.readUnsignedInt());
        report.ids.push(bytes.readUnsignedInt());

        //设置胜利次数
        report.win = 0;
        for (i = 0; i < 3; i++) {
            if (report.wins[i] == 1) {
                report.win++;
            }
        }
        return report;
    }

    private function readTeamWarReportData(bytes:ByteArray):TeamWarReportStruct {
        var report:TeamWarReportStruct = new TeamWarReportStruct();
        var i:int;
        for (i = 0; i < 6; i++) {
            var member:BTMemberStruct = new BTMemberStruct;
            member.name = BytesUtil.readUserName(bytes);
            member.flag = BytesUtil.readByte1(bytes);
            member.imgID = BytesUtil.readByte1(bytes);
            member.power = bytes.readUnsignedInt();
            report.battlers[i] = member;
        }
        var winData:int = BytesUtil.readByte1(bytes);
        report.wins[0] = winData & 1;
        report.wins[1] = winData >> 1 & 1;
        report.wins[2] = winData >> 2 & 1;

        report.ids.push(bytes.readUnsignedInt());
        report.ids.push(bytes.readUnsignedInt());
        report.ids.push(bytes.readUnsignedInt());

        //设置胜利次数
        report.win = 0;
        for (i = 0; i < 3; i++) {
            if (report.wins[i] == 1) {
                report.win++;
            }
        }
        return report;
    }

    private function readTeamData(bytes:ByteArray):* {

        var report:SWarP1Struct = new SWarP1Struct();
        var tempbyte:int = 0;
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        report.fightID = BytesUtil.readUint64(idBytes);
        report.lv = BytesUtil.readByte1(bytes);

        report.flv = bytes.readUnsignedInt();
        report.fpop = BytesUtil.readByte2(bytes);
        report.tael = BytesUtil.readByte1(bytes);
        //report.portrait = BytesUtil.readByte1(bytes);
        report.fightName = BytesUtil.readUserName(bytes);
        return report;

    }

    private function readTeamWarResult(bytes:ByteArray):TeamResultStruct {
        var resultStruct:TeamResultStruct = new TeamResultStruct();

        var results:Array = [];
        var reports:Vector.<TeamWarReportStruct> = new Vector.<TeamWarReportStruct>();

        resultStruct.fightNums = BytesUtil.readByte1(bytes);
        var resultNum:uint = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < resultStruct.fightNums; i++) {
            results.push((resultNum >> i) & 0x01);
            var report:TeamWarReportStruct = readTeamWarReportData(bytes);
            reports.push(report);
        }
        resultStruct.wins = results;

        var count:uint = 0;
        for (i = 0; i < results.length; i++) {
            if (results[i] == 1) {
                count++;
            }
        }

        resultStruct.win = 0;
        if (count * 2 > results.length)
            resultStruct.win = 1;

        resultStruct.reports = reports;
        return resultStruct;
    }

    /**
     *进入16强的队伍数据 包含3个队员数据
     * @param bytes
     * @return
     *
     */
    private function readTeamData2(bytes:ByteArray):* {
        var team:BattleTeamStruct = new BattleTeamStruct();
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        team.teamId = BytesUtil.readUint64(idBytes);
        team.name = BytesUtil.readUserName(bytes);
        team.lv = BytesUtil.readByte1(bytes);
        team.portrait = BytesUtil.readByte1(bytes);
        team.power = bytes.readUnsignedInt();
        team.fpop = BytesUtil.readByte2(bytes);
        team.morale = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < 3; i++) {
            var member:BTMemberStruct = new BTMemberStruct;
            member.name = BytesUtil.readUserName(bytes);
            member.flag = BytesUtil.readByte1(bytes);
            member.imgID = BytesUtil.readByte1(bytes);
            member.power = bytes.readUnsignedInt();
            team.members[i] = member;
        }
        return team;
    }


}
}
