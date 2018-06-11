/**
 * Created by dingcj on 2017/8/22.
 */
package com.game.common.view {
import com.game.common.mediator.CommonWindowMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import ui.commonWindow.CommonWindowUI;

public class CommonWindowView extends BaseWindow {

    private var title:String;//标题
    private var content:String;//内容
    private var sureHandle:Handler;//右边按钮触发事件
    private var cancelHandle:Handler;//左边按钮触发事件
    private var sureTxt:String;//右边按钮上的字
    private var cancelTxt:String;//左边按钮上的字

    public var cancelClick:SignalDispatcher;
    public var sureClick:SignalDispatcher;

    private var ui:CommonWindowUI;

    public function CommonWindowView() {
        cancelClick = new SignalDispatcher();
        sureClick = new SignalDispatcher();
        super()
    }

    override public function getMediator():BaseMediator {
        return new CommonWindowMediator(this);
    }

    function  get vo() {
        return _data;
    }

    override public function onComplete():void {

        this.title = vo[0];
        this.content = vo[1];
        this.sureHandle = vo[2];
        this.cancelHandle = vo[3];
        this.sureTxt = vo[4] ? vo[4] : "确定";
        this.cancelTxt = vo[5] ? vo[5] : "取消";

        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new CommonWindowUI();
        addChild(ui);
        init();
    }

    private function init():void {
        ui.titleLabel.text = title;
        ui.contentLabel.text = content;
        ui.sureBtn.label = sureTxt;
        ui.cancelBtn.label = cancelTxt;

        ui.sureBtn.on(Event.CLICK, this, onClickBtn);
        ui.cancelBtn.on(Event.CLICK, this, onClickBtn);
    }

    private function onClickBtn(e:Event):void {
        if (e.target == ui.cancelBtn) {
            if (cancelHandle != null)cancelHandle.run();
            cancelClick.dispatch(null);
        }
        else if (e.target == ui.sureBtn) {
            if (sureHandle != null)sureHandle.run();
            sureClick.dispatch(null);
        }
    }

    override public function dispose():void {
        cancelClick.dispose();
        sureClick.dispose();
        if (sureHandle){
            sureHandle.clear();
            sureHandle=null;
        }
        if (cancelHandle){
            cancelHandle.clear();
            cancelHandle=null;
        }
        ui.destroy();
        super.dispose();
    }
}
}