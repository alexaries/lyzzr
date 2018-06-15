/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.ExpertInfoMediator;
import com.game.module.copy.view.items.PropertyItem;
import com.game.module.copy.view.items.PropertyValueItem;

import laya.events.Event;
import laya.utils.Handler;

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
        updateState();
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

    private var propertyValueItem:PropertyValueItem;

    private function init():void {
        //这个只会在生成的时候初始化一次
        //become visiable 的时候是不会重新调用一次的

        ui.bg.on(Event.CLICK, this, onCloseBtn);
        ui.hireBtn.on(Event.CLICK, this, onHireBtn);
        ui.freeBtn.on(Event.CLICK, this, onFreeBtn);
        ui.upBtn.on(Event.CLICK, this, onUpBtn);

        updateState();

        ui.propertyList.itemRender = PropertyItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
        ui.propertyList.repeatX = 3;
        ui.propertyList.spaceX = 50;
        ui.propertyList.spaceY = 10;

        if (!propertyValueItem) {
            propertyValueItem = new PropertyValueItem();
            ui.propertyContainer.addChild(propertyValueItem);
        }
    }

    private function onRenderPropertyItem(cell:PropertyItem):void {

    }

    private function updateState() {
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

        if (ui.propertyList.renderHandler)ui.propertyList.renderHandler.clear();
        if (propertyValueItem) {
            propertyValueItem.destroy();
            propertyValueItem = null;
        }
    }
}
}