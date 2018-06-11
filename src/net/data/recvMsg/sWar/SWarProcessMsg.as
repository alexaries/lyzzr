package net.data.recvMsg.sWar {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.sWar.BTMemberStruct;
import net.data.structs.sWar.TeamWarReportStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class SWarProcessMsg extends BaseMsg {

    public var type:uint;
    public var result:uint;
    public var portrait:uint;
    public var reportID:uint;
    public var fightName:String;
    public var report:TeamWarReportStruct;

    public function SWarProcessMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            if ([1, 2].indexOf(type) > -1) {
                result = BytesUtil.readByte1(bytes);
                portrait = BytesUtil.readByte1(bytes);
                reportID = bytes.readUnsignedInt();
                fightName = BytesUtil.readUserName(bytes);
            } else if ([4].indexOf(type > -1)) {
                fightName = BytesUtil.readUserName(bytes);
                portrait = BytesUtil.readByte1(bytes);
                report = readTeamWarReportDataMore(bytes);
            }
        } catch (e:*) {

        }
        return true;
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
}
}
