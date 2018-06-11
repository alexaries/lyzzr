/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view.cell {
import com.game.module.task.vo.item.TaskTrackItemVo;

import laya.ui.Box;

import ui.task.TaskTrackCellUI;

import utils.CSSStyleCfg;

public class TaskTrackListCell extends Box {

    var ui:TaskTrackCellUI;
    public var vo:TaskTrackItemVo;
    public function TaskTrackListCell():void {

    }


    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskTrackCellUI()
        addChild(ui);
        ui.content.style.fontFamily = CSSStyleCfg.defaultFontName;
        ui.content.style.fontSize = CSSStyleCfg.defaultFontSize;
        ui.content.style.lineHeight = 30;
        ui.content.style.align = "left";
        ui.content.style.color = "#91beef";

        ui.txtTitle.style.fontFamily = CSSStyleCfg.defaultFontName;
        ui.txtTitle.style.fontSize = 35;
        ui.txtTitle.style.lineHeight = 35;
        ui.txtTitle.style.align = "left";
        ui.txtTitle.style.valign = "top";
        ui.txtTitle.style.color = "#f3ce0b";
    }

    public function init(vo:TaskTrackItemVo ):void {
        this.vo=vo;
        //任务 描述
        if(vo.tipArray && vo.tipArray.length == 2){
            ui.content.innerHTML =  vo.tipArray[1] ;
            ui.txtTitle.innerHTML = vo.tipArray[0];
        }else{
            ui.txtTitle.innerHTML = vo.tips;
            ui.content.innerHTML = "";
        }
        if(vo.task){
            switch (vo.task.cfg.type) {
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
}