/**
 * Created by huangcb on 2017/9/29.
 */
package com.game.module.task.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class TaskDialogProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TaskDialogProxy";

    public function TaskDialogProxy() {
        super(NAME);

    }
}
}