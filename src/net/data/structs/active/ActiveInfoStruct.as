package net.data.structs.active {
/**
 * @author hokenny
 */
public class ActiveInfoStruct {
    public var activeScore:uint = 0;
    public var currActiveValue:uint = 0;
    public var totalActiveValue:uint = 0;
    public var taskInfo:Array = [];//[id,currValue,totalValue]
    public var awardState:uint = 0;

    public var currScores:uint;
    public var sign:uint;
    public var goodsId:uint;
    public var goodsN:uint;
    public var goodsS:uint;
}
}
