/**
 * Created by dingcj on 2018/1/9.
 */
package com.game.module.sysAlert.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.sysAlert.mediator.SysAlertMediator;
import com.game.module.sysAlert.vo.SysAlertRequest;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.login.LoginNoticeUI;

import utils.HtmlUtil;

public class SysAlertView extends BaseWindow {

    private var ui:LoginNoticeUI;
    public var closeSignal:SignalDispatcher = new SignalDispatcher();

    private var elasticBackTime:int = 300;
    private var elasticDistance:int = 100;

    public function SysAlertView() {
        super();
        layer = 11;
    }

    override public function getMediator():BaseMediator {
        return new SysAlertMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();

        init();
        adapt();

        SysAlertRequest.getInstance().requestServerJsonP();
    }

    private function __onComplete():void {
        ui = new LoginNoticeUI();
        addChild(ui);
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onCloseBtn);

        initPanel();
        initHtml();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function onCloseBtn():void {
        closeSignal.dispatch(null);
    }

    private function initPanel():void {
        ui.msgPanel.vScrollBarSkin = "";
        ui.msgPanel.vScrollBar.isVertical = true;
        ui.msgPanel.vScrollBar.elasticBackTime = elasticBackTime;
        ui.msgPanel.vScrollBar.elasticDistance = elasticDistance;
    }

    private function initHtml():void {
        if (ui.msgHtml)ui.msgHtml.innerHTML = HtmlUtil.color("暂无");
    }

    public function onAlertComplete(data:*):void {
        if (ui.msgHtml)ui.msgHtml.innerHTML = data;
    }

    override public function dispose():void {
        closeSignal.dispose();
        ui.closeBtn.off(Event.CLICK, this, onCloseBtn);
        super.dispose();
    }
}
}