/**
 * Created by huangcb on 2017/9/12.
 */
package com.game.module.task.view {
import com.game.common.view.BaseDialog;
import com.game.module.task.mediator.TaskCycAutoRefreshMediator;
import com.game.module.task.vo.TaskCycVo;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Dialog;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import ui.task.TaskCycAutoRefreshUI;

public class TaskCycAutoRefreshView extends BaseDialog {
    public var vo:TaskCycVo;
    private var ui:TaskCycAutoRefreshUI;

    private var num:int = 0;//自动刷新次数
    private var quality:int = 0;//品质
    public var numClick:SignalDispatcher;
    public var refreshClick:SignalDispatcher;

    public function TaskCycAutoRefreshView() {
        numClick = new SignalDispatcher();
        refreshClick = new SignalDispatcher();
        super();
    }

    override public function getMediator():BaseMediator {
        return new TaskCycAutoRefreshMediator(this);
    }

    private function onChangeTab(index:int):void {
        quality = index;
    }

    private function onClickMinusBtn():void {
        if (num > 0)num--;
        ui.numBtn.label = "" + num;
    }

    private function onClickNumBtn():void {
        numClick.dispatch(null);
    }

    private function onClickAddBtn():void {
        num++;
        if (num >= vo.maxCount){
            num = vo.maxCount;
        }
        ui.numBtn.label = "" + num;
    }

    public function onNotifyNum(num_:Number):void {
        num = num_;
        if (num >= vo.maxCount){
            num = vo.maxCount;
        }
        ui.numBtn.label = "" + num;
    }

    override public function dispose():void {
        closeHandler.clear();
       // closeHandler = null;
        removeEventHandler();

     //   ui.qualityTab.selectHandler = null;
//        closeClick.dispose();
//        closeClick = null;
        numClick.dispose();
      //  numClick = null;
        refreshClick.dispose();
    //    refreshClick = null;
        super.dispose();
    }

    override public function setContent():void {
        ui = new TaskCycAutoRefreshUI();
        setUI(ui);
        super.setContent();

        addEventHandler();
    }

    private function addEventHandler():void {
        closeHandler = Handler.create(this, doCloseHandler, null, false);

        ui.qualityTab.selectHandler = Handler.create(this, onChangeTab, [], false);
        ui.qualityTab.selectedIndex = 0;

        ui.minusBtn.on(Event.CLICK, this, onClickMinusBtn);
        ui.numBtn.on(Event.CLICK, this, onClickNumBtn);
        ui.addBtn.on(Event.CLICK, this, onClickAddBtn);
    }

    private function removeEventHandler():void {
        //ui.addBtn.off(Event.MOUSE_DOWN, this, startAdd);
        ui.qualityTab.selectHandler.clear();
        ui.qualityTab.selectHandler=null;
        ui.minusBtn.off(Event.CLICK, this, onClickMinusBtn);
        ui.numBtn.off(Event.CLICK, this, onClickNumBtn);
        ui.addBtn.off(Event.CLICK, this, onClickAddBtn);
    }

    override public function refresh():void {
        if(!vo){
            return;
        }
        ui.qualityTab.selectedIndex = vo.color - 2;
        num = Math.min(5,vo.maxCount);
        ui.numBtn.label = num + "";

        ui.maxLabel.text = "可输入自动刷新最大次数:" + vo.maxCount + "次";
        ui.refreshBtn.disabled = vo.maxCount == 0;
    }

    private function doCloseHandler(type:String):void {
        if (type == Dialog.OK) {
            refreshClick.dispatch([quality, num]);
        } else if (type == Dialog.CLOSE) {

        }
    }
}
}