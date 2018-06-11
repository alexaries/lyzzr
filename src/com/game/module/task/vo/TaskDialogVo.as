package com.game.module.task.vo {
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.utils.TaskUtils;

import net.data.structs.task.NpcInteractStruct;

import com.game.utils.ShellUtils;

/**
 * @author john
 */
public class TaskDialogVo {
    public var npcId:uint;
    public var type:uint;
    private var _talks:Array = [];

    public function TaskDialogVo() {
    }


    public function get funcs():Array {
        var arr:Array = [];
        if (npc) {
            switch (npc.type) {
                case 2:
                    arr = arr.concat(TaskUtils.toNpcTalks([1000]));
//						arr = arr.concat(TaskUtils.toNpcTalks([1000, 1001]));
                    break;
                case 4:
                    arr = arr.concat(TaskUtils.toNpcFunction(npcId));
                    break;
                case 6:
                    break;
            }
        }
        return arr;
    }

    public function get talks():Array {
        return _talks ;
    }
    public function get allTalks():Array {
        return _talks.concat(funcs);
    }
    public function get npc():TaskNpcStruct {
        return ShellUtils.npcById(this.npcId);
        // return ShellUtils.npcInBuildById(this.npcId);
    }


    public function get hasHalf():Boolean {
        return npc && npc.halfId > 0;
    }

    public function set talks(talks:Array):void {
        _talks = talks;
    }
}
}
