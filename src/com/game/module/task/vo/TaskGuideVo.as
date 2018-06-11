package com.game.module.task.vo {
import com.game.module.task.struct.TaskNpcStruct;
import com.game.vo.TaskCfg;

import globals.ConfigLocator;

import net.data.structs.task.NpcInteractStruct;

import com.game.utils.ShellUtils;

/**
 * @author john
 */
public class TaskGuideVo {
    public var npcId:uint;
    public var msg:String;
    public var talk:NpcInteractStruct;
    public var canFinish:Boolean;

    public function TaskGuideVo() {
    }

    public function get npc():TaskNpcStruct {
        return ShellUtils.npcById(this.npcId);
    }

    /*
     *
     */


    public function get task():TaskCfg {
        var taskId:uint = 0;
        if (talk) {
            taskId = talk.interactId;
        }
        return ConfigLocator.getInstance().taskDic.get(taskId) as TaskCfg;
    }

    public function get hasHalf():Boolean {
        return npc && npc.halfId > 0;
    }
}
}
