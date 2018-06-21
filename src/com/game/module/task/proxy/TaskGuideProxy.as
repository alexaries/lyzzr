/**
 * Created by dingcj on 2017/9/29.
 */
package com.game.module.task.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.module.task.vo.TaskGuideVo;

import org.puremvc.as3.interfaces.IProxy;

public class TaskGuideProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskGuideProxy";


    public var taskGuideVo:TaskGuideVo;
    public function TaskGuideProxy() {
        super(NAME);


        taskGuideVo = new TaskGuideVo();

    }
}
}