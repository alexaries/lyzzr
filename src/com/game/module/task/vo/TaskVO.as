/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.vo {
import com.game.vo.TaskCfg;

import globals.ConfigLocator;

public class TaskVO {


    /**
     * 任务编号
     */
    public var taskId:uint = 0;
    /**
     * 循环任务类型:
     * 当type=3时候
     * 1001
     * */
    public var cycType:uint;
    /**
     * 当是循环任务时:
     * 是否自动完成
     * */
    public var cycIsAuto:Boolean;
    /**
     * 当是循环任务时:
     * 任务颜色
     * */
    public var cycColor:uint;
    /**
     * 当是循环任务时:
     * 循环次数
     * */
    public var cycStep:uint;
    /**
     * 当是循环任务时:
     * 循环总次数
     * */
    public var cycCount:uint;
    /**
     * 任务状态:0未完成，1完成 ,2 可接,3不可接
     */
    public var state:uint;

    /**
     * 当前进度
     * */
    public var plan:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var time:uint = 0;
    public var monsters:uint;

    public function  get cfg():TaskCfg {
        return ConfigLocator.getInstance().taskDic.get(taskId);
    }
    public function get stateType():int{
        if(state==0) return 1;
        if(state==1) return 0
        if(state==2) return 2;

        if(state==3) return 3;

        return 0;
    }
    public function get type():int{
        return cfg.type;
    }
    //主线>可领奖>未接取>已接取
    public function TaskVO() {
    }

}
}