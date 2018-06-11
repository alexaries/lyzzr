package net.data.structs.sWar {
/**
 */
public class TeamWarReportStruct extends SWarReportDataStruct {
    public var win:uint = 0;//胜利次数
    //6名队员
    public var battlers:Array = new Array(6);// 0 - 2攻 3 - 5 守
    public var wins:Array = [];
    public var ids:Array = [];
    public var attackTeamName:String = "";//攻方队伍名
    public var defenseTeamName:String = "";//守方队伍名

    public function clone():TeamWarReportStruct {
        var t:TeamWarReportStruct = new TeamWarReportStruct();
        t.attackTeamName = attackTeamName;
        t.battlers = battlers;
        t.btimes = btimes;
        t.defenseTeamName = defenseTeamName;
        t.fightName = fightName;
        t.ids = ids;
        t.wins = wins;
        t.win = win;
        t.result = result;
        return t;
    }
}
}
