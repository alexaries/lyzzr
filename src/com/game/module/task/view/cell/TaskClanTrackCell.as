/**
 * Created by huangcb on 2018/3/17.
 */

package com.game.module.task.view.cell {
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.signal.SignalDispatcher;

import laya.ui.Box;
import laya.utils.Handler;

import ui.clan.clanItem.TaskClanTrackCellUI;

import utils.CSSStyleCfg;

public class TaskClanTrackCell extends Box {

    var ui:TaskClanTrackCellUI;
    public var vo:TaskTrackItemVo;
    var tasksOpenSignal:SignalDispatcher;
    public function TaskTrackListCell():void {

    }


    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskClanTrackCellUI()
        addChild(ui);
        ui.content.style.fontFamily = CSSStyleCfg.defaultFontName;
        ui.content.style.fontSize = CSSStyleCfg.defaultFontSize;
        ui.content.style.lineHeight = 30;
        ui.content.style.align = "left";
        ui.content.style.color = "#91beef";
        ui.task_state.clickHandler= Handler.create(this, onBtnClick,null,false);
    }

    private function onBtnClick():void {
        tasksOpenSignal.dispatch([vo]);
    }

    public function init(vo:TaskTrackItemVo , _tasksOpenSignal:SignalDispatcher):void {
        this.vo=vo;
        this.tasksOpenSignal=_tasksOpenSignal;
        //任务 描述
        if(vo.tipArray && vo.tipArray.length == 2){
            ui.content.innerHTML =  vo.tipArray[1] ;
            ui.txtTitle.text = vo.tipArray[0];
        }else{
            ui.txtTitle.text = vo.tips;
            ui.content.innerHTML = "";
        }
        if(vo.task.state==TaskState.RESOLVED){
            ui.task_state.label="领取奖励";
            ui.task_state.skin = "common/button/btn_r_1.png";
            ui.img_bg.skin = "module/clan/task_1_2.png";
            ui.img_title.skin = "module/clan/task_bg_title2.png";
        }
        if(vo.task.state==TaskState.PENDING){
            ui.task_state.label="前往任务";
            ui.task_state.skin = "common/button/btn_b_1.png";
            ui.img_bg.skin = "module/clan/task_1_1.png";
            ui.img_title.skin = "module/clan/task_bg_title.png";
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