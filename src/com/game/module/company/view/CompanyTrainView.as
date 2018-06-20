/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.company.mediator.CompanyTrainMediator;

import laya.events.Event;

import ui.company.CompanyTrainViewUI;

public class CompanyTrainView extends BaseView {

    private var ui:CompanyTrainViewUI;

    public function CompanyTrainView() {
        super([]);
    }

    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new CompanyTrainMediator(this);
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
        ui = new CompanyTrainViewUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
    }

    private function onClickCloseBtn():void {
        this.hide();
    }

    public function refresh():void {
        
    }
}
}