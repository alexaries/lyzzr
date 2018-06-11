/**
 * Created by huangcb on 2017/9/6.
 */
package com.game.module.task.view.cell {
import com.game.module.task.vo.item.TaskNpcItemVo;

import laya.ui.Box;

import ui.task.TaskNpcListCellUI;

import com.game.utils.ShellUtils;
import utils.StringUtil;

public class TaskNpcListCell extends Box {
    public static var TEMP_TITLE:String = "<{0}>";
    public var vo:TaskNpcItemVo;
    var ui:TaskNpcListCellUI;

    public function TaskNpcListCell() {
    }


    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskNpcListCellUI();
        addChild(ui);
    }

    public function init(vo:TaskNpcItemVo, index):void {
        this.vo = vo;
        refresh();
    }

    public function refresh():void {
        if (vo.npc) {
            ui.imgHead.skin = ShellUtils.toHeadURL(vo.npc);
            ui.labLv.text = vo.levelStr;
            ui.labName.text = String(vo.npc.name);
            ui.labTitle.text="";
            if (vo.npc.title != "")
                ui.labTitle.text = StringUtil.substitute(TEMP_TITLE, [vo.npc.title]);
            drawIcons();
        }
        this.visible = !!vo.npc;
        return;
    } 
    public function drawIcons():void {

        var icon:uint;
        while (ui.mcIcons.numChildren > 0) {
            ui.mcIcons.removeChildAt(0);
        }
        for each (icon in vo.icons) {
            if (icon > 0) {
                //todo 增加icon
            }
        }

        return;
    }
}
}
