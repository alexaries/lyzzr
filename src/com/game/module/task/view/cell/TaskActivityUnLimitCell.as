/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view.cell {
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.signal.SignalDispatcher;

import laya.display.css.CSSStyle;
import laya.html.dom.HTMLDivElement;

import laya.ui.Box;
import laya.utils.Handler;

import ui.task.TaskActivityUnLimitCellUI;

import utils.CSSStyleCfg;

public class TaskActivityUnLimitCell extends Box {

    public var vo:DailyUnlimitedActItemVo = new DailyUnlimitedActItemVo();
    public var ui:TaskActivityUnLimitCellUI;
    public var actSignal:SignalDispatcher;

    public function TaskActivityUnLimitCell() {
    }

    private function setDefaultCSS(s:HTMLDivElement):void{
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#ffd542";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 560;
        s.style.height = 80;
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskActivityUnLimitCellUI();

        ui.btnOK.clickHandler = Handler.create(this, onClick, null, false)
        addChild(ui);
    }

    private function onClick():void {
        actSignal.dispatch(vo);
    }

    public function init(value:DailyVo, index:int, _actSignal:SignalDispatcher):void {
        actSignal = _actSignal
        vo.index = index;
        vo.dataVo = value;
        refresh();
        return;
    }

    private function refresh():void {
        setDefaultCSS(ui.labState);
        setDefaultCSS(ui.taTip);
        ui.labState.style.width = 100;

        ui.taTip.innerHTML = vo.tipStr;
        ui.labState.innerHTML = vo.stateStr;
//        ui.bmp.loadImage(vo.bmpUrl);
        ui.bmp.skin = vo.bmpUrl;
        ui.btnOK.label = vo.buttonStr;
        if (vo.sendState == 1) {

        } else {
        }
        return;
    }
}
}
