package net.data.structs.ctwar {
public class CTWarReportStruct {
    public function CTWarReportStruct() {
    }

    /**
     * 类型
     * 0 - 一血
     * 1 - 战斗
     * 2 - 轮空
     * */
    public var type:int;

    public var player1:String;
    public var player1Country:int;
    /**
     * 玩家1连杀
     * */
    public var player1Freak:int;
    public var player1Score:int;


    public var player2:String;
    public var player2Country:int;
    /**
     * 玩家2连杀
     * */
    public var player2Freak:int;
    public var player2Score:int;

}
}