package net.data.structs.strongRoad {
/**
 */
public class StrongInfoStruct {
    public var score:uint = 0;
    public var currValue:uint = 0;//当前变强之魂数值
    public var totalValue:uint = 0;  //任务总数
    public var taskInfo:Array = [];//[id,currValue,totalValue] 项目ID 当前完成次数 总次数
    public var awardStates:Array = [];//[id,currValue,totalValue]

    public var currScores:uint; //当前变强之魂数值
    public var sign:uint;
    public var strongId:uint;   //变强之魂ID

    public var boxInfo:Array = [];//[id,flag] 宝箱id 宝箱状态
}
}
