/**
 * Created by huangcb on 2017/12/6.
 */
package com.game.module.task.vo {
public class TaskState {
    /**
     * 任务状态:0未完成，1完成 ,2 可接,3不可接  PENDING
     */
    public static const PENDING:int=0;
    public static const RESOLVED : uint = 1;

    public static const WAIT:int=2;
    public static const ABORTED : uint = 3;
}
}
