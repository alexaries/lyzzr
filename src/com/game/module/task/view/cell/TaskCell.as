/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view.cell {
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskVO;

import laya.ui.Box;
import laya.ui.Clip;

import ui.task.TaskCellUI;

public class TaskCell extends Box {
    public var ui:TaskCellUI

    public function TaskCell() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskCellUI();
        addChild(ui);
        var selectBox:Clip = ui.removeChildByName("selectBox") as Clip;
        selectBox.name = "selectBox";
        addChild(selectBox);
    }

    public function init(vo:TaskVO, index:int):void {
        ui.title.text = vo.cfg.name;

        if (vo.state == TaskState.PENDING) {
            ui.txtState.text = "未完成";
            ui.txtState.color = "#feffce";
        } else if (vo.state == TaskState.RESOLVED) {
            ui.txtState.text = "已完成";
            ui.txtState.color = "#7ef14c";
        } else if (vo.state == TaskState.WAIT) {
            ui.txtState.text = "可接";
            ui.txtState.color = "#feffce";
        }

        switch (vo.cfg.type) {
            case 1:
                ui.typeIcon.skin = "module/task/zhu.png";
                break;
            case 2:
                ui.typeIcon.skin = "module/task/zhi.png";
                break;
            case 4:
                ui.typeIcon.skin = "module/task/teacher.png";
                break;
            case 5:
                ui.typeIcon.skin = "module/task/ya.png";
                break;
            case 6:
                ui.typeIcon.skin = "module/task/bang.png";
                break;
            default :
                ui.typeIcon.skin = "";
                break;
        }
    }
}
}
