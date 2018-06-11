package net.data.structs.task {
/**
 * 玩家获取当前任务列表
 */
public class TaskStruct {
    /**
     * 任务流水号
     */
    public var flowId:uint = 0;
    /**
     * 任务类型：主线任务、支线任务、每日任务
     */
    public var taskType:uint = 0;
    /**
     * 任务编号
     */
    public var taskId:uint = 0;
    /**
     * 任务接受时间
     */
    public var acceptTime:uint = 0;
    /**
     *  当前所有任务步骤进度
     */
    public var stepList:Array = [];
    /**
     * 任务有效开始时间
     */
    public var validStartTime:uint = 0;
    /**
     * 任务有效截止时间
     */
    public var validEndTime:uint = 0;
    /**
     * 任务是否已完成
     */
    public var isCompleted:uint = 0;
    /**
     * 任务是否已提交
     */
    public var isSubmit:uint = 0;

    public function TaskStruct() {
    }
}
}