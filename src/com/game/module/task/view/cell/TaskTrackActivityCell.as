/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view.cell {
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.signal.SignalDispatcher;

import lang.LangTxt;

import laya.html.dom.HTMLDivElement;

import laya.ui.Box;
import laya.utils.Handler;

import ui.task.TaskTrackActivityCellUI;

import utils.CSSStyleCfg;

import utils.StringUtil;

public class TaskTrackActivityCell extends Box {
    public var ui:TaskTrackActivityCellUI;
    private var actSignal:SignalDispatcher;
    public var vo:Object;
    public function TaskTrackActivityCell() {
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskTrackActivityCellUI()
        ui.btnOK.visible=false;
        ui.btnOK.clickHandler = Handler.create(this, onClick, null, false)
        addChild(ui);
    }

    private function onClick():void {
        actSignal.dispatch(vo);
    }

    public function init(vo:Object, index:int, _actSignal:SignalDispatcher):void {
        this.vo=vo;
        actSignal = _actSignal
        //任务 描述


        if (vo instanceof  DailyLimitActItemVo) {
            refreshLimit(vo as DailyLimitActItemVo);
        }

        if (vo instanceof  DailyUnlimitedActItemVo) {
            refreshUnLimit(vo as DailyUnlimitedActItemVo);
        }

    }

    private function setDefaultCSS(s:HTMLDivElement):void{
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 30;
        s.style.color = "#91beef";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 351;
        s.style.height = 35;
    }

    private function refreshUnLimit(vo:DailyUnlimitedActItemVo):void {
        setDefaultCSS(ui.labTip);
        setDefaultCSS(ui.labTip1);
//        ui.labTip.style.width = 121;
        ui.labTip.innerHTML = vo.tipStr;
        ui.labTip1.innerHTML = vo.stateStr;

        ui.btnOK.label = vo.buttonStr;
        if (vo.sendState == 1) {

        } else {

        }
        return;
    }

    private function refreshLimit(vo:DailyLimitActItemVo):void {
        setDefaultCSS(ui.labTip);
        setDefaultCSS(ui.labTip1);
        ui.labTip.style.width = 121;

        ui.labTip.innerHTML = vo.nameStr;
        switch (vo.index) {
            case 2:
                ui.labTip1.innerHTML = StringUtil.substitute("<p align='center'>" + LangTxt.LEFT_EXP_SPEED_STR + "</p>", [vo.dataVo.dayValueList[5]]);
                break;
            default:
                ui.labTip1.innerHTML = vo.dayIndexValueString;
                break;
        }
        ui.btnOK.label = vo.buttonStr;


        return;
    }
}
}
