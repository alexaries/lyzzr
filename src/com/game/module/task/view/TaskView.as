/**
 * Created by huangcb on 2017/8/17.
 */
package com.game.module.task.view {
import com.game.common.view.BaseView;
import com.game.module.pack.view.ItemIcon;
import com.game.module.task.mediator.TaskMediator;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.view.cell.TaskCell;
import com.game.module.task.vo.TaskVO;
import com.signal.SignalDispatcher;

import laya.display.css.CSSStyle;

import laya.events.Event;
import laya.html.dom.HTMLDivElement;
import laya.net.Loader;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import net.consts.AppConst;

import ui.task.TaskUI;

import utils.CSSStyleCfg;

import utils.StringUtil;

public class TaskView extends BaseView {
    public var ui:TaskUI;
    public var doTaskListOpenSignal:SignalDispatcher;
    public var gotoTaskSignal:SignalDispatcher;
    public var showFrameMsgSignal:SignalDispatcher;
    public var taskLists:Array=[];
    //任务界面
    var taskVo:TaskVO;
    public function TaskView() {
        gotoTaskSignal = new SignalDispatcher();
        doTaskListOpenSignal = new SignalDispatcher();
        showFrameMsgSignal = new SignalDispatcher();
        ui = new TaskUI();
        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);
    }

    private function setDefaultCSS(s:HTMLDivElement):void{
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#F9E9C7";
        s.style.width = 880;
    }


    override public function dispose():void {
        ui.awardList.renderHandler.clear()
        ui.tasks.renderHandler.clear()
        ui.tasks.mouseHandler.clear()
        gotoTaskSignal.dispose();
        gotoTaskSignal = null;
        doTaskListOpenSignal.dispose();
        doTaskListOpenSignal = null;
        showFrameMsgSignal.dispose();
        showFrameMsgSignal = null;

        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskMediator(this);
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
        ui.taskany.visible = false;
        ui.awardList.itemRender = ItemIcon;
        ui.awardList.renderHandler = Handler.create(this, onItemIconRenderHandler, null, false);
        ui.tasks.selectEnable = true;
        ui.tasks.renderHandler = Handler.create(this, onRenderHandler, null, false);
        ui.tasks.mouseHandler = Handler.create(this, onMouseHandler, null, false);
        ui.tasks.itemRender = TaskCell;
        ui.tasks.scrollBar.visible=false;
        addChild(ui);

        ui.btnGo.on(Event.CLICK,this,gotoTaskHandler);
    }

    private function gotoTaskHandler():void {
        if(taskVo){
            gotoTaskSignal.dispatch(taskVo);
        }

    }

    private function onItemIconRenderHandler(cell:ItemIcon, index):void {
        cell.setData(ui.awardList.array[index]);
    }

    private function onMouseHandler(e:Event, index:int):void {
        if (e.type == Event.CLICK) {
            doTaskListOpenSignal.dispatch(ui.tasks.array[index]);
        }
    }

    public function showTaskVO(taskVo:TaskVO, flow:Array):void {
        this.taskVo=taskVo;
        setDefaultCSS(ui.describe);
        setDefaultCSS(ui.flow);
        setDefaultCSS(ui.reward);

        ui.describe.innerHTML = StringUtil.substitute(TaskUtils.TEMP_MAIN_DESC, [toDesc(taskVo)]);
        ui.flow.innerHTML = StringUtil.substitute(TaskUtils.TEMP_MAIN_FLOW, flow);
        ui.reward.innerHTML = StringUtil.substitute(TaskUtils.TEMP_MAIN_AWARD, [toAward(taskVo)]);
        ui.awardList.array = (toAwardGoods(taskVo));
/*
        if([1,3,4,5,7,8,10].indexOf(taskVo.cfg.klass)&&taskVo.state==0){
            ui.btnGo.visible=false;
            return;
        }
        ui.btnGo.visible=true;
        */
    }

    private function toDesc(taskVo:TaskVO):String {
        var html:String;
        html = TaskUtils.toTaskDesc(taskVo.taskId);
        return html;
    }


    private function toAward(taskVo:TaskVO):String {
        var html:String;
        html = TaskUtils.toTaskAward(taskVo.taskId).join("&nbsp;");
        return html;
    }

    private function toAwardGoods(taskVo:TaskVO):Array {
        var arr:Array;
        arr = TaskUtils.toTaskAwardGoods(taskVo.taskId);
        return arr;
    }

    private function onRenderHandler(cell:TaskCell, index):void {
        cell.init(ui.tasks.array[index], index);
    }
    override public function set visible(value:Boolean):void {
        super.visible = value;
        if(value){
            refresh();
        }else{
            showFrameMsgSignal.dispatch([""]);
        }
    }
    public function refresh():void {
        if(!visible){
            return;
        }
        if ( taskLists.length > 0) {
            ui.taskany.visible = true;
            ui.tasks.array = taskLists;
            ui.tasks.selectedIndex = 0;
            doTaskListOpenSignal.dispatch(ui.tasks.array[0]);
            showFrameMsgSignal.dispatch([""]);
        } else {
            ui.taskany.visible = false;
            showFrameMsgSignal.dispatch(["暂无已接任务哦！"]);
        }
    }
}
}
