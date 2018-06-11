package net.data.structs.clan {
/**
 * @author ryan
 */
public class CDepotRecordStruct {

    /**
     */
    public var type:int;
    public var time:uint;
    public var pName:String;
    public var preStr:String;

    //===============资金列表-===========

    /**
     *捐献者名字
     */
    public var moneyName:String;
    /**
     * 捐献的类型：1-建设，2-神魔之树
     */
    public var moneyTotype:int;
    /**
     *货币类型 1-银币，2-仙石
     */
    public var moneyType:int;
    /**
     * 捐献数量
     */
    public var moneyNum:int;
    /**
     *捐献时间
     */
    public var moneyTime:uint;

}
}
