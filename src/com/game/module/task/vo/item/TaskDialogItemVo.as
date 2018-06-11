package com.game.module.task.vo.item {
import com.game.module.task.vo.TaskVO;

import config.mission.configmodule.IConfigmodule_module_item;

import globals.ConfigLocator;

import net.data.structs.task.NpcInteractStruct;

/**
 * @author john
 */
public class TaskDialogItemVo {
    public var talk:NpcInteractStruct;

    public var taskVo:TaskVO

    public function get func():IConfigmodule_module_item {
        var obj:IConfigmodule_module_item;
        if (talk && talk.interactToken == 0) {
            obj = ConfigLocator.getInstance().moduleDic.get(talk.interactId);
        }
        return obj;
    }


}
}
