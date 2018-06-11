package net.data.structs.clan {
/**
 * 宗族战  战报结构
 * @author RyanCao
 *
 */
public class CFReportStruct {
    public function CFReportStruct() {
    }

    /**
     * 轮次
     */
    public var turn:int = 0;
    /**
     * 轮空与否 <br> 1战斗 <br> 2轮空
     */
    public var flag:int = 0;

    public var winnerName:String;
    public var winnerClan:String;
    public var winnerCoutry:int;
    /**
     * 宗族城战用到
     */
    public var winnerTag:int;

    public var loserName:String;
    public var loserCoutry:int;
    public var loserClan:String;
    /**
     * 宗族城战用到
     */
    public var loserTag:int;
    /**
     * 需要判断  宗族名是否有和自己宗族相同的
     * 如果有相同的 则去截取reportId
     */
    public var reportID:uint;
}
}