/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view.cell {
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.signal.SignalDispatcher;

import lang.LangTxt;

import laya.display.css.CSSStyle;
import laya.html.dom.HTMLDivElement;

import laya.ui.Box;
import laya.utils.Handler;

import org.puremvc.as3.patterns.facade.Facade;

import ui.task.TaskActivityLimitCellUI;

import utils.CSSStyleCfg;

import utils.StringUtil;

public class TaskActivityLimitCell extends Box {
    public var vo:DailyLimitActItemVo = new DailyLimitActItemVo();
    public var ui:TaskActivityLimitCellUI;
    public var actSignal:SignalDispatcher;

    public function TaskActivityLimitCell() {
    }

    private function setDefaultCSS(s:HTMLDivElement):void {
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#ffd542";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 230;
        s.style.height = 40;
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskActivityLimitCellUI();
        ui.btnOk.clickHandler = Handler.create(this, onClick, null, false)
        addChild(ui);
    }

    private function onClick():void {
        actSignal.dispatch(vo);
    }

    public function init(value:DailyVo, index:int, _actSignal:SignalDispatcher):void {
        actSignal = _actSignal;
        vo.index = index;
        vo.dataVo = value;
        refresh();
        return;
    }

    private function refresh():void {
        setDefaultCSS(ui.labTip);
        setDefaultCSS(ui.labTip1);
        ui.labTip1.width = 520;

        ui.labTip.innerHTML = vo.nameStr;
        switch (vo.index) {
            case 1:
                //ui.labTip1.innerHTML = StringUtil.substitute("<p align='center'>" + "今日共可加速{0}次" + "</p>", [vo.dataVo.dayValueList[5]]);
                ui.labTip1.innerHTML = StringUtil.substitute("<p align='center'>" + "今日共可加速{0}次" + "</p>", [20]);
                break;
            default:
                ui.labTip1.innerHTML = vo.dayIndexValueString;
                break;
        }
        ui.btnOk.label = vo.buttonStr;


        return;
    }

}
}
