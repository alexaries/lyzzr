package net.data.recvMsg.carrer {

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.carrer.CarrerPStruct;
import net.data.structs.carrer.CarrerReportDataStruct;
import net.data.structs.carrer.CarrerResultStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CarrerMsg extends BaseMsg {
    /**
     * 0 - 状态信息
     1 - 报名状态信息
     2 - 单职业竞技信息
     3 - 策略风暴
     4 - 全明星赛
     5 - 人气达人
     6 - 逆转乾坤
     */
    public var type:uint;
    /**
     * 当前届数
     */
    public var session:uint;
    /**
     *第几日
     */
    public var day:uint;


    /**
     *1:报名
     2:策略搭配
     3:单职业预选赛
     4:单职业淘汰赛
     5:策略预选赛
     6:单职业决赛
     7:明星预选赛
     8:策略淘汰赛,人气
     9:明星淘汰赛
     10:策略决赛
     11:明星决赛
     12:逆转乾坤
     13:结果
     */
    public var sessionState:uint;
    //单个比赛进度
    public var state:uint;

    /**
     *职业 1儒 2释 3道
     */
    public var carrer:uint = 3;

    public var isIn:uint;
    /**
     * 距离报名结束时间
     */
    public var time:uint;
    public var pNums:uint;
    //AB组标志
    public var flag:uint;
    public var datas:Array;
    public var reports:Array;
    public var finalReports:Array;
    public var betInfoDatas:Array;
    public var pdatas:Array;
    public var floor:uint;
    public var round:uint;
    public var isUpState:uint;

    public var tearmID:uint;
    public var all_len:uint;

    public function CarrerMsg() {
        super();
    }

    public function test():void {
        var p1:CarrerPStruct;
        var i:int = 0;
        var report:CarrerReportDataStruct;
        var result:CarrerResultStruct;
        datas = [];
        pdatas = [];
        for (i = 0; i < 32; i++) {
            p1 = readP1Data();
            p1.fightName = "职业" + carrer + "玩家" + i
            pdatas.push(p1);
        }

        for (i = 0; i < 32; i++) {
            result = readResult();
            datas.push(result);
        }

        setRs()

    }


    public function test2():void {
        var p1:CarrerPStruct;
        var i:int = 0;

        var result:CarrerResultStruct;
        datas = [];
        pdatas = [];
        for (i = 0; i < 4; i++) {
            p1 = readP1Data();
            p1.fightName = "选手" + i
            pdatas.push(p1);
        }
        //			for ( i = 0; i < 32; i++) {
        //				report = readReportData();
        //				report.btimes = i + 1 ;
        //				datas.push(report);
        //			}
        var f:int = 0;
        for (i = 0; i < 2; i++) {
            result = readResult();
            result.players.push(pdatas[f++])
            result.players.push(pdatas[f++])
            datas.push(result);
        }

        //setRs()

    }


    private function setRs():void {
        var i:int = 0;
        var result:CarrerResultStruct;
        var f:int = 0;
        for (i = 0; i < 32; i++) {
            result = datas[i]
            var rs1:CarrerResultStruct;
            var rs2:CarrerResultStruct;

            if (i < 16) {
                result.players.push(pdatas[f]);
                result.players.push(pdatas[f + 1]);
                f = f + 2

            } else if (i < 24) {
                if (i == 16) f = 0
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            } else if (i < 28) {
                if (i == 23) f = 23
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            } else if (i < 30) {
                if (i == 27) f = 27
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            } else if (i < 32) {
                if (i == 29) f = 29
                rs1 = datas[f]
                rs2 = datas[f + 1];
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            }


        }
    }

    private function setRs16(len:uint):void {
        var i:int = 0;
        var result:CarrerResultStruct;
        var f:int = 0;
        for (i = 0; i < len; i++) {
            result = datas[i]
            var rs1:CarrerResultStruct;
            var rs2:CarrerResultStruct;

            if (i < 8) {
                result.players.push(pdatas[f]);
                result.players.push(pdatas[f + 1]);
                f = f + 2;

            } else if (i < 12) {
                if (i == 8) f = 0
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            } else if (i < 14) {
                if (i == 12) f = 8
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            } else if (i < 16) {
                if (i == 14) f = 12
                rs1 = datas[f]
                rs2 = datas[f + 1];
                f = f + 2;
                result.players.push(rs1.winner);
                result.players.push(rs2.winner);
            }


        }
    }


    /**
     * {{0, 5}, {1, 4}, {2, 3}},
     {{0, 4}, {1, 2}, {3, 5}},
     {{0, 3}, {1, 5}, {2, 4}},
     {{0, 2}, {1, 3}, {4, 5}},
     {{0, 1}, {2, 5}, {3, 4}}
     * 决赛对阵表
     *
     */
    private var vsArr:Array = [[0, 5], [1, 4], [2, 3],
        [0, 4], [1, 2], [3, 5],
        [0, 3], [1, 5], [2, 4],
        [0, 2], [1, 3], [4, 5],
        [0, 1], [2, 5], [3, 4]]

    /**
     *
     * @param len
     *
     */
    private function setFinalRs(len:uint):void {
        finalReports = [];
        var i:int = 0;
        var result:CarrerResultStruct;
        var report:CarrerReportDataStruct
        var f:int = 0;
        for (i = 0; i < len; i++) {
            result = datas[i]

            for (var j:int = 0; j < 3; j++) {
                report = new CarrerReportDataStruct;
                var a:uint = vsArr[f][0];
                var b:uint = vsArr[f][1];
                f++;
                var p1:CarrerPStruct = pdatas[a];
                var p2:CarrerPStruct = pdatas[b];

                if (p1) {
                    report.fightName = p1.fightName;
                } else {
                    report.fightName = ""
                }
                if (p2) {
                    report.fightName2 = p2.fightName;
                } else {
                    report.fightName2 = ""
                }
                report.reportID = result.battleIds[j];
                report.result = result.wins[j];
                finalReports.push(report);

//					trace(a+"::"+b+"    "+report.fightName+" VS "+report.fightName2+"   Id:"+report.reportID+" battle"+report.result);
            }

        }
    }


    /**
     *选出自己的战报
     *
     */
    public function setReports(userName:String):void {
        for (var i:int = 0; i < datas.length; i++) {
            var result:CarrerResultStruct = datas[i];
            var player1:CarrerPStruct = result.players[0];
            var player2:CarrerPStruct = result.players[1];
            var report:CarrerReportDataStruct;
            for (var j:int = 0; j < result.wins.length; j++) {
                if (player1.fightName == userName || player2.fightName == userName) {
                    report = new CarrerReportDataStruct;
                    report.titleFlag = type - 2;
                    report.bflag = 1;
                    report.resultStruct = result;
                    report.result = result.wins[j];
                    report.fightName = player1.fightName;
                    report.fightName2 = player2.fightName;
                    if (state == 3 || state == 4 || state == 6) {
                        report.group = 2;
                    } else {
                        report.group = 1;
                    }
                    report.reportID = result.battleIds[j];
                    if (report.reportID > 0) {
                        if (report.fightName == userName) {
                            reports.push(report);

                        } else if (report.fightName2 == userName) {
                            if (report.result == 0) {
                                report.result = 1;
                            } else if (report.result == 1) {
                                report.result = 0;
                            }
                            reports.push(report);
                        }
                    }
                }
            }
        }
    }

    private function getWiner(rs:CarrerResultStruct):CarrerPStruct {
        return rs.players[rs.win]
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
//				trace("MSG单挑："+type)
        var len:int = 0;
        var i:int = 0;
        var p1:CarrerPStruct;
        var report:CarrerReportDataStruct;
        var result:CarrerResultStruct;
        datas = [];
        reports = [];
        betInfoDatas = [];
        pdatas = [];
        switch (type) {
            case 0:
                //day = BytesUtil.readByte1(bytes);
                sessionState = BytesUtil.readByte1(bytes);
                isIn = BytesUtil.readByte1(bytes);
                //isUpState = BytesUtil.readByte1(bytes);

                break;
            case 1:
                isIn = BytesUtil.readByte1(bytes);
                time = bytes.readUnsignedInt();
                pNums = BytesUtil.readByte2(bytes);
                break;
            case 2://单职业查询返回
                carrer = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                if (state == 0) {
                    //预选赛
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        report = readReportData(bytes);
                        report.btimes = i + 1;
                        datas.push(report);
                    }
                }
                //晋级赛
                switch (state) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        len = 16;
                        dealPkData(len, bytes);
                        break;
                    case 5:
                    case 6:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 4;
                        dealPkData(len, bytes);
                        break;
                    case 7:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 6;
                        dealFinalPkData(bytes);
                        setFinalRs(round)
                        break;
                }
                break;
            case 3://查询策略风暴竞技
                carrer = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                if (state == 0) {
                    //预选赛
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        report = readReportData(bytes);
                        report.btimes = i + 1;
                        datas.push(report);
                    }
                }
                //晋级赛
                switch (state) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        len = 16;
                        dealPkData(len, bytes);
                        break;
                    case 5:
                    case 6:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 4;
                        dealPkData(len, bytes);
                        break;
                    case 7:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 6;
                        dealFinalPkData(bytes);
                        setFinalRs(round)
                        break;
                }
                break;
            case 4://全明星查询返回
                carrer = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                if (state == 0) {
                    //预选赛
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        report = readReportData(bytes);
                        report.btimes = i + 1;
                        report.fightName = "队伍" + report.portrait;
                        datas.push(report);
                    }
                }
                //晋级赛

                switch (state) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        len = 16;
                        dealPkData(len, bytes);
                        for (i = 0; i < pdatas.length; i++) {
                            p1 = pdatas[i];
                            if (p1.portrait > 0)
                                p1.fightName = "队伍" + p1.portrait;
                        }
                        break;
                    case 5:
                    case 6:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 4;
                        dealPkData(len, bytes);
                        for (i = 0; i < pdatas.length; i++) {
                            p1 = pdatas[i];
                            if (p1.portrait > 0)
                                p1.fightName = "队伍" + p1.portrait;
                        }
                        break;
                    case 7:
                        //flag = BytesUtil.readByte1(bytes);

                        len = 6;
                        dealFinalPkData(bytes);
                        for (i = 0; i < pdatas.length; i++) {
                            p1 = pdatas[i];
                            if (p1.portrait > 0)
                                p1.fightName = "队伍" + p1.portrait;
                        }
                        setFinalRs(round)
                        break;
                }
                break;


            case 6:
                toData6(bytes);
                break;
            case 8:
                flag = BytesUtil.readByte1(bytes);
                state = BytesUtil.readByte1(bytes);
                break;
            default:
        }

        return true;
    }


    private function dealFinalPkData(bytes:ByteArray):void {
        var len:int = BytesUtil.readByte1(bytes);
        var p1:CarrerPStruct;
        var report:CarrerReportDataStruct;
        var result:CarrerResultStruct;
        var i:uint = 0;
        for (i = 0; i < len; i++) {
            p1 = readP1Data(bytes);
            p1.pos = i;
            p1.group = flag;
            pdatas.push(p1);
        }
        round = BytesUtil.readByte1(bytes);

        for (i = 0; i < round; i++) {
            result = readResult(bytes);
            datas.push(result);
        }


    }


    private function dealPkData(len:int, bytes:ByteArray):void {
        var p1:CarrerPStruct;
        var result:CarrerResultStruct;
        var i:uint = 0;
        for (i = 0; i < len; i++) {
            p1 = readP1Data(bytes);
            p1.pos = i;
            p1.group = flag;

            pdatas.push(p1);
        }
        round = 2;
        round = BytesUtil.readByte1(bytes);
        var arr:Array = [0, 8, 12, 14, 15, 2]
        var l:uint = arr[round]
        for (i = 0; i < l; i++) {
            result = readResult(bytes);
            datas.push(result);
        }

        setRs16(l);

    }

    private function deal4PkData(len:int, bytes:ByteArray):void {
        var p1:CarrerPStruct;
        var result:CarrerResultStruct;
        var i:uint = 0;
        for (i = 0; i < len; i++) {
            p1 = readP1Data(bytes);
            p1.pos = i;
            p1.group = flag;
            p1.fightName = p1.fightName + i;
            pdatas.push(p1);
        }
        round = 2;
        round = BytesUtil.readByte1(bytes);
        //var arr:Array=[0,8,12,14,15,2]
        var l:uint = 2
        for (i = 0; i < l; i++) {
            result = readResult(bytes);
            datas.push(result);
        }

        setRs16(l)
        //setReports();
    }

    //var temp:int=RandomUtil.integer(0,1);

    private function readResult(bytes:ByteArray = null):CarrerResultStruct {
        var resultStruct:CarrerResultStruct = new CarrerResultStruct();

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

//			temp=Math.round(Math.random());
//			var results : Array = [];
//			var resultIDs : Array = [];
//			var len : int = 5
//			var tempbyte : int = 1
//				
//			for (var i : int = 0; i < len; i++) {
//					results.push(temp);
//				resultIDs.push(1);
//			}
//			resultStruct.wins = results ;
//			resultStruct.battleIds = resultIDs ;
        return resultStruct;
    }

    private function readP1Data(bytes:ByteArray = null):* {
        var report:CarrerPStruct = new CarrerPStruct();
        if (bytes) {
            report.portrait = BytesUtil.readByte2(bytes);
            report.lv = BytesUtil.readByte1(bytes);
            report.fightName = BytesUtil.readUserName(bytes);

        }

        return report;
    }

    private function readP2Data(bytes:ByteArray):* {
        var report:CarrerPStruct = new CarrerPStruct();
        var tempbyte:int = 0;
        tempbyte = BytesUtil.readByte1(bytes);
        report.portrait = tempbyte & 0x07;
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

    private function readReportData(bytes:ByteArray = null):* {
        var report:CarrerReportDataStruct = new CarrerReportDataStruct();
        if (bytes) {
            //var tempbyte : int = BytesUtil.readByte1(bytes);
            report.titleFlag = type - 2;
            report.bflag = 0;
            report.group = BytesUtil.readByte1(bytes) + 1;
            report.result = BytesUtil.readByte1(bytes);

            if (report.result == 2) {
                report.result = 1;
            }
            report.portrait = BytesUtil.readByte2(bytes);
            report.reportID = bytes.readUnsignedInt();
            //report.color = (tempbyte >> 3) & 0x07;
            //report.countryID = (tempbyte >> 6) & 0x03;

            // report.lv = BytesUtil.readByte1(bytes);
            report.fightName = BytesUtil.readUserName(bytes);
        }
//			report.bflag = BytesUtil.readByte1(bytes);
//			report.result =BytesUtil.readByte1(bytes);
//			report.portrait =BytesUtil.readByte1(bytes);
//			report.reportID = bytes.readUnsignedInt();
//			report.fightName = BytesUtil.readUserName(bytes);
        // report.lv = BytesUtil.readByte1(bytes);

        return report;
    }


    /**
     *逆转乾坤数据
     * @param bytes
     *
     */
    private function toData6(bytes:ByteArray = null):void {

        carrer = BytesUtil.readByte1(bytes);

        floor = bytes.readUnsignedShort();
        time = bytes.readUnsignedInt();
        var i:int = 0;
        for (i = 0; i < 3; i++) {
            var player:CarrerPlayerMsg = new CarrerPlayerMsg();
            player.name = BytesUtil.readUserName(bytes);
            player.n = bytes.readUnsignedShort();
            player.time = bytes.readUnsignedInt();
            pdatas.push(player);
        }
        var len:int = bytes.readUnsignedShort();
        var report:CarrerReportDataStruct;
        for (i = 0; i < len; i++) {
            report = readFloorReportData(bytes);
            //report.lv=s
            //report.btimes=100+s*10+i
            datas.push(report);
        }

        /*s++;
         time=500+s;
         floor=10+s;
         var i:int=0;
         carrer=1;
         pdatas=[]
         datas=[]
         for (i=0;i<3;i++){
         var player:CarrerPlayerVo=new CarrerPlayerVo;
         player.n=100+i;
         player.name="蜘蛛人"+i;
         player.time=60+i+s;
         pdatas.push(player);
         }
         */

    }

    /**
     *逆转乾坤战报
     * @param bytes
     * @return
     *
     */
    private function readFloorReportData(bytes:ByteArray = null):* {
        var report:CarrerReportDataStruct = new CarrerReportDataStruct();
        if (bytes) {
            report.lv = bytes.readUnsignedShort();
            report.btimes = bytes.readUnsignedInt();
            report.result = BytesUtil.readByte1(bytes);
            report.reportID = bytes.readUnsignedInt();
            report.portrait = bytes.readUnsignedInt();
        }

        return report;
    }
}
}
