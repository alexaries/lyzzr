/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view {
import com.game.common.view.BaseView;
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.mediator.TaskActivityMediator;
import com.game.module.task.view.cell.TaskActivityLimitCell;
import com.game.module.task.view.cell.TaskActivityUnLimitCell;
import com.signal.SignalDispatcher;

import laya.display.css.CSSStyle;
import laya.html.dom.HTMLDivElement;
import laya.net.Loader;

import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import net.consts.AppConst;

import ui.task.TaskActivityUI;

import utils.CSSStyleCfg;

public class TaskActivityView extends BaseView {

    private var ui:TaskActivityUI;
    public var vo:DailyVo;
    public var lstLimitActSignal:SignalDispatcher;
    public var lstUnlimitedActSignal:SignalDispatcher;

    public function TaskActivityView() {
        lstLimitActSignal = new SignalDispatcher();
        lstUnlimitedActSignal = new SignalDispatcher();
        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);

    }

    private function setDefaultCSS(s:HTMLDivElement):void{
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#ffd542";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 1040;
        s.style.height = 60;
    }

    override public function dispose():void {
        ui.lstLimitAct.renderHandler.clear()
        ui.unlstLimitAct.renderHandler.clear()
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskActivityMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        ui = new TaskActivityUI();
        addChild(ui);
        ui.lstLimitAct.itemRender = TaskActivityLimitCell;
        ui.lstLimitAct.renderHandler = Handler.create(this, onTaskActivityLimitRenderHandler, null, false);

        ui.unlstLimitAct.itemRender = TaskActivityUnLimitCell;
        ui.unlstLimitAct.renderHandler = Handler.create(this, onTaskActivityUnLimitRenderHandler, null, false);
    }

    private function onTaskActivityUnLimitRenderHandler(cell:TaskActivityUnLimitCell, index):void {
        cell.init(ui.unlstLimitAct.array[index], index, lstUnlimitedActSignal);

    }

    private function onTaskActivityLimitRenderHandler(cell:TaskActivityLimitCell, index):void {
        cell.init(ui.lstLimitAct.array[index], index, lstLimitActSignal);

    }

    public function refresh(weekTip:String):void {
        setDefaultCSS(ui.unlstTip);
        setDefaultCSS(ui.lstTip);
        ui.unlstTip.innerHTML = weekTip;
        ui.lstTip.innerHTML = "限时活动";
        //    labTimeTip.visible = vo.timeItem.tipShow?false:true;

        rTime();
        return;
    }

    private function rTime():void {
        if (vo.timeItem) {
            ///   bmpTime.url = StaticConfig.httpServer + vo.timeItem.bmp;
            //  taTimeDesc.htmlText = vo.timeItem.desc;
            //   labTimeTip.htmlText = vo.timeInfo;
//				labTimeTip.htmlText = ShellUtils.substitute("<font color='#2CC345'>{3}    {0}:00 - {1}:00     {2}</font>", vo.timeItem["st"], vo.timeItem["et"], vo.timeItem["reward"],LangTxt.TO_OPEN_UP + LangTxt.TIME);
        }
        return;
    }

    public function setlstLimitActProvider(toDB:Array):void {
        ui.lstLimitAct.array = toDB;
    }

    public function setlstUnlimitedActProvider(toDB:Array):void {
        ui.unlstLimitAct.array = toDB;
    }

    public function setTimeActIndex(timeActIndex:int):void {

    }
}
}