/**
 * Created by huangcb on 2017/9/12.
 */
package com.game.module.task.view.cell {
import com.game.module.task.vo.item.TaskCycItemVo;
import com.signal.SignalDispatcher;

import lang.LangTxt;

import laya.html.dom.HTMLDivElement;
import laya.ui.Box;
import laya.utils.Handler;

import net.data.recvMsg.task.TaskCycFreshVOMsg;

import ui.task.TaskCycCellUI;

import utils.CSSStyleCfg;

public class TaskCycCell extends Box {
    public var vo:TaskCycItemVo = new TaskCycItemVo();
    public var ui:TaskCycCellUI

    var tasksOpenSignal:SignalDispatcher;

    public function TaskCycCell() {
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskCycCellUI();
        addChild(ui)
        ui.btnAccept.label = LangTxt.TASK_VIEW_9;
        ui.btnSubimt.label = LangTxt.TASK_VIEW_10;
        ui.btnFinish.label = LangTxt.TASK_VIEW_11;
        ui.btnAccept.clickHandler = Handler.create(this, doBtnAcceptClick, [], false)
        ui.btnFinish.clickHandler = Handler.create(this, doBtnFinishClick, [], false)
        ui.btnSubimt.clickHandler = Handler.create(this, doBtnSubmitClick, [], false)
        setDefaultCSS(ui.labName)
    }

    private function setDefaultCSS(s:HTMLDivElement):void {
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 35;
        s.style.color = "#ffd542";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 235;
        s.style.height = 45;
    }

    private function doBtnAcceptClick():void {
        vo.cmd = 0;
        tasksOpenSignal.dispatch(vo);
    }

    private function doBtnSubmitClick():void {
        vo.cmd = 1;
        tasksOpenSignal.dispatch(vo);
    }

    private function doBtnFinishClick():void {
        vo.cmd = 2;
        tasksOpenSignal.dispatch(vo);
    }

    public function init(value:TaskCycFreshVOMsg, vipCfgs:Array,index, tasksOpenSignal:SignalDispatcher):void {
        this.tasksOpenSignal = tasksOpenSignal;
        vo.id = value.id
        vo.color = value.color
        vo.setAward(value.level)
        vo.pos = index;
        vo.vipCfgs=vipCfgs;
        refresh();
        return;
    }


    private function refresh():void {
        this.visible = !!vo.task;
        if (vo.task) {
            ui.labName.innerHTML = vo.labName
            ui.labAward.text = vo.labAward
            ui.taDesc.text = vo.taDesc
        }

        ui.btnFinish.visible = true;
        if (vo.vipCfgs[8] == 1 || vo.canCycTaskFinish) {
        } else {
            ui.btnFinish.visible = false;

        }
        return;
    }


}
}
