/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.company.mediator.CompanyEditorMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.company.CompanyEditorViewUI;

public class CompanyEditorView extends BaseView {

    private var ui:CompanyEditorViewUI;
    public var closeSignal:SignalDispatcher;

    public function CompanyEditorView() {
        super([]);
        closeSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CompanyEditorMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    public function refresh():void {

    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        ui = new CompanyEditorViewUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.bg.on(Event.CLICK, this, onClickBgBtn);
    }

    private function onClickBgBtn():void {

    }

    override public function dispose():void {
        super.dispose();
        if (closeSignal)closeSignal.dispose();
        ui.bg.off(Event.CLICK, this, onClickBgBtn);
    }
}
}