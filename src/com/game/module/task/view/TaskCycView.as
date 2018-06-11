/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view {
import com.game.common.view.BaseFrame;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.mediator.TaskCycMediator;
import com.game.module.task.view.cell.TaskCycCell;
import com.game.module.task.vo.TaskCycVo;
import com.signal.SignalDispatcher;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import ui.task.TaskCycUI;

import utils.StringUtil;

public class TaskCycView extends BaseFrame {
    public static const TOTAL_NUM:int = 10;
    public var vo:TaskCycVo;

    public var ui:TaskCycUI
    public var dailyVo:DailyVo;
    public var freeClickSignal:SignalDispatcher;
    public var goldClickSignal:SignalDispatcher;
    public var tasksOpenSignal:SignalDispatcher;

    public function TaskCycView() {
        super()
        freeClickSignal=new SignalDispatcher();
        goldClickSignal=new SignalDispatcher();
        tasksOpenSignal=new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new TaskCycMediator(this);
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        ui = new TaskCycUI();
//        addChild(ui);
        ui.btnFree.clickHandler = Handler.create(this, onFreeRefreshClick, null, false)
        ui.btnGold.clickHandler = Handler.create(this, onGoldRefreshClick, null, false)
        ui.btnAuto.clickHandler = Handler.create(this, onRefreshClick, null, false)
//        ui.closeBtn.clickHandler = Handler.create(this, tryDispose);
        ui.tlTasks.renderHandler = Handler.create(this, onRenderHandler, null, false);
        ui.tlTasks.itemRender = TaskCycCell;

        ui.btnGold.label = LangTxt.HAND+LangTxt.REFRESH;
        ui.btnFree.label = LangTxt.FREE+LangTxt.REFRESH;
        ui.btnAuto.label = LangTxt.AUTO+LangTxt.REFRESH;
        setContent(ui);
        setTitle("衙门任务");
    }

    private function onGoldRefreshClick():void {
        goldClickSignal.dispatch(null);
    }

    private function onFreeRefreshClick():void {
        freeClickSignal.dispatch(null);
    }


    private function onRenderHandler(cell:TaskCycCell, index):void {
        cell.init(ui.tlTasks.array[index],vo.vipCfgs, index,tasksOpenSignal);

    }

    private function onRefreshClick():void {
        var refreshView:TaskCycAutoRefreshView = new TaskCycAutoRefreshView();
        refreshView.vo = vo;
        refreshView.popup(true);
    }

    public function refresh():void {
        var title:String = LangArrayTxt.TASK_VIEW_18[vo.cyc];
        setTitle(title + "任务");
        ui.txtTaskType.text = "今日已完成" + title + "任务:";
        ui.labNum1.text = vo.finishCount + "/" + [dailyVo.cycTask4Max, dailyVo.cycTask5Max][vo.cyc];
        ui.labNum2.text = (TOTAL_NUM - vo.leftCount).toString();
        ui.tips.text = StringUtil.substitute(LangTxt.TASK_CYC_TIP, [vo.cost]);
        ui.btnFree.visible = vo.leftCount != TOTAL_NUM;
        ui.btnGold.visible = vo.leftCount == TOTAL_NUM;
        ui.tips.visible = vo.leftCount == TOTAL_NUM;
        if (vo.tasks) {
            ui.tlTasks.array = vo.tasks;
        }
    }

    override public function dispose():void {
        ui.btnFree.clickHandler.clear()
        ui.btnGold.clickHandler.clear()
        ui.btnAuto.clickHandler.clear()
//        ui.closeBtn.clickHandler = Handler.create(this, tryDispose);
        ui.tlTasks.renderHandler.clear()
        freeClickSignal.dispose();
        goldClickSignal.dispose();
        tasksOpenSignal.dispose();
        super.dispose();
    }
}
}