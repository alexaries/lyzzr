/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.ExpertInfoMediator;

import laya.events.Event;

import ui.battle.ExpertInfoViewUI;

public class ExpertInfoView extends BaseView {

    private var ui:ExpertInfoViewUI;
    private var type:int;

    //type==0 休假 战斗界面
    //type==1 雇佣
    //type==2 休假+升级 战斗界面
    public function initInfo(type:int):void {
        this.type = type;
    }

    public function ExpertInfoView() {
        super([]);
    }

    override public function getMediator():BaseMediator {
        return new ExpertInfoMediator(this);
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
        ui = new ExpertInfoViewUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.bg.on(Event.CLICK, this, onCloseBtn);
        ui.hireBtn.on(Event.CLICK, this, onHireBtn);
        ui.freeBtn.on(Event.CLICK, this, onFreeBtn);
        ui.upBtn.on(Event.CLICK, this, onUpBtn);

        ui.freeBtn.visible = type == 0 || type == 2;
        ui.hireBtn.visible = type == 1;
        ui.upBtn.visible = type == 2;

        if (type == 0) {
            ui.freeBtn.pos(492, 1440);
        }
        else if (type == 2) {
            ui.freeBtn.pos(316, 91);
            ui.upBtn.pos(722, 1440);
        }
    }

    private function onUpBtn():void {
        trace("你点击了升级");
    }

    private function onFreeBtn():void {
        hide();
    }

    private function onHireBtn():void {
        hide();
    }

    private function onCloseBtn():void {
        hide();
    }

    override public function dispose():void {
        super.dispose();

        ui.bg.off(Event.CLICK, this, onCloseBtn);
        ui.hireBtn.off(Event.CLICK, this, onHireBtn);
        ui.freeBtn.off(Event.CLICK, this, onFreeBtn);
        ui.upBtn.off(Event.CLICK, this, onUpBtn);
    }
}
}