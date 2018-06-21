package com.game.module.task.vo.item {
import com.game.module.task.vo.TaskVO;

import net.data.structs.task.NpcInteractStruct;

/**
 * @author john
 */
public class TaskDialogItemVo {
    public var talk:NpcInteractStruct;

    public var taskVo:TaskVO

    public function get func():* {
        return null;
    }
}
}
