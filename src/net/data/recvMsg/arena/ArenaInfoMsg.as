package net.data.recvMsg.arena {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.arena.ArenaBaseInfo;
import net.data.structs.arena.ArenaInfoStruct;
import net.data.structs.arena.ArenaNewFightInfo;
import net.data.structs.arena.AthlTypeInfo;
import net.data.structs.arena.FightInfoStruct;
import net.data.structs.arena.FightInfoStruct2;
import net.data.structs.arena.ReportInfoStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xD0 返回斗剑列表信息
 */
public class ArenaInfoMsg extends BaseMsg {
    public var type:uint = 0;
    public var baseInfo:ArenaBaseInfo;
    public var rankList:Array;
    public var playerList:Array;
    public var reportList:Array;
    public var fightInfoList:Array;
    public var winNum:uint = 0;
    public var fightNewInfo:ArenaNewFightInfo;

    public function ArenaInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte2(bytes);
        if ((type & 0x01) != 0)
            readBaseInfo(bytes);
        if ((type & 0x02) != 0)
            readRankInfo(bytes);
        if ((type & 0x04) != 0) readListInfo(bytes);
        if ((type & 0x08) != 0)
            readReportInfo(bytes);
        if ((type & 0x10) != 0)
            readFightInfo(bytes);
        if (type == 0x20)
            readFightNewInfo(bytes);

        return true;
    }

    private function readFightNewInfo(bytes:ByteArray):void {
        fightNewInfo = new ArenaNewFightInfo();
        fightNewInfo.athlPhy = BytesUtil.readByte1(bytes);
        fightNewInfo.maxPhy = BytesUtil.readByte1(bytes);
        fightNewInfo.winNum = BytesUtil.readByte1(bytes);
        fightNewInfo.state = BytesUtil.readByte1(bytes);

        if (fightNewInfo.state == 0) {
            var num:int = BytesUtil.readByte1(bytes);
            for (var i:uint = 0; i < num; i++) {
                fightNewInfo.athTypeSts.push(AthlTypeInfo.read(bytes));
            }
        }
        else if (fightNewInfo.state == 1) {
            fightNewInfo.athlDifficulty = BytesUtil.readByte1(bytes);
            fightNewInfo.athlCategory = BytesUtil.readByte1(bytes);
            fightNewInfo.award = bytes.readUTF();
            var n:int = BytesUtil.readByte1(bytes);
            for (var j:uint = 0; j < n; j++) {
                var fightInfo:FightInfoStruct2 = new FightInfoStruct2();
                fightInfo.userName = BytesUtil.readUserName(bytes);
                fightInfo.level = BytesUtil.readByte1(bytes);
                fightInfo.career = BytesUtil.readByte1(bytes);
                fightInfo.sex = BytesUtil.readByte1(bytes);
                fightInfo.color = BytesUtil.readByte1(bytes);
                fightInfo.country = BytesUtil.readByte1(bytes);
                fightInfo.canFight = BytesUtil.readByte1(bytes);
                fightNewInfo.athRivalSts.push(fightInfo);
            }

        }
    }

    private function readBaseInfo(bytes:ByteArray):void {
        baseInfo = new ArenaBaseInfo();
        baseInfo.currRank = bytes.readUnsignedInt();
        baseInfo.maxRank = bytes.readUnsignedInt();
        baseInfo.fightTimes = BytesUtil.readByte1(bytes);
        baseInfo.winStreak = BytesUtil.readByte2(bytes);
        baseInfo.time = BytesUtil.readByte2(bytes);
        baseInfo.prestige = bytes.readUnsignedInt();
        baseInfo.silver = bytes.readUnsignedInt();
        baseInfo.exsTime = BytesUtil.readByte2(bytes);
    }

    private function readRankInfo(bytes:ByteArray):void {
        var num:uint = BytesUtil.readByte1(bytes);
        rankList = [];
        for (var i:uint = 0; i < num; i++) {
            rankList.push([BytesUtil.readByte1(bytes), BytesUtil.readUserName(bytes), BytesUtil.readByte1(bytes)]);
        }
    }

    private function readListInfo(bytes:ByteArray):void {
        var num:uint = BytesUtil.readByte1(bytes);
        playerList = [];
        for (var i:uint = 0; i < num; i++) {
            var arenaInfo:ArenaInfoStruct = new ArenaInfoStruct();
            arenaInfo.index = bytes.readUnsignedInt();
            arenaInfo.userName = BytesUtil.readUserName(bytes);
            arenaInfo.country = BytesUtil.readByte1(bytes);
            arenaInfo.level = BytesUtil.readByte1(bytes);
            arenaInfo.winNums = BytesUtil.readByte2(bytes);
            arenaInfo.pf = BytesUtil.readByte1(bytes);
            playerList.push(arenaInfo);
        }
    }

    private function readReportInfo(bytes:ByteArray):void {
        var num:uint = BytesUtil.readByte1(bytes);
        reportList = [];
        for (var i:uint = 0; i < num; i++) {
            var reportInfo:ReportInfoStruct = new ReportInfoStruct();
            reportInfo.userName = BytesUtil.readUserName(bytes);
            reportInfo.country = BytesUtil.readByte1(bytes);
            reportInfo.result = BytesUtil.readByte1(bytes);
            reportInfo.battleId = bytes.readUnsignedInt();
            reportList.push(reportInfo);
        }
    }

    private function readFightInfo(bytes:ByteArray):void {
        winNum = BytesUtil.readByte1(bytes);
        var num:uint = BytesUtil.readByte1(bytes);
        fightInfoList = [];
        for (var i:uint = 0; i < num; i++) {
            var fightInfo:FightInfoStruct = new FightInfoStruct();
            fightInfo.userName = BytesUtil.readUserName(bytes);
            fightInfo.country = BytesUtil.readByte1(bytes);
            fightInfo.career = BytesUtil.readByte1(bytes);
            fightInfo.sex = BytesUtil.readByte1(bytes);
            fightInfo.level = BytesUtil.readByte1(bytes);
            fightInfo.canFight = BytesUtil.readByte1(bytes);
            fightInfo.pf = BytesUtil.readByte1(bytes);
            fightInfoList.push(fightInfo);
        }
    }
}
}
