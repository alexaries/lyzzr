package net.data.structs.carrer {
/**
 * @author ryan
 */
public class CarrerReportDataStruct {
    /**
     * 榜单文字类别  天地 金银 星月
     */
    public var titleFlag:uint;
    /**
     *阶段 0预选 1入榜 2决赛
     */
    public var bflag:int = 0;
    /**
     *天地组
     */
    public var group:int = 1;
    public var btimes:int = 1;
    public var result:int = 1;
    public var reportID:uint = 1;
    public var countryID:int = 1;
    public var lv:int = 1;
    public var fightName:String = "";
    public var fightName2:String = "";
    public var portrait:int;
    public var color:int;
    public var resultStruct:CarrerResultStruct;

    public function clone():CarrerReportDataStruct {
        var report:CarrerReportDataStruct = new CarrerReportDataStruct;
        report.group = this.group;
        report.btimes = this.btimes;
        report.result = this.result;
        report.reportID = this.reportID;
        report.countryID = this.countryID;
        report.lv = this.lv;
        report.fightName = this.fightName;
        report.fightName2 = this.fightName2;
        report.portrait = this.portrait;
        report.color = this.color;
        report.resultStruct = this.resultStruct;
        return report;
    }
}
}
