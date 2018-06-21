/**
 * Created by huangcb on 2017/8/26.
 */
package com.game.module.task.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class TaskHookProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskHookProxy";

    public function TaskHookProxy() {
        super(NAME);
    }
}
}