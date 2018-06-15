/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.view.items {
import com.game.module.copy.view.items.PropertyItem;
import com.game.module.copy.view.items.PropertyValueItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;
import laya.utils.Handler;

import ui.battle.ExpertItemUI;

public class ExpertItem extends Box {

    private var ui:ExpertItemUI;
    private var _index:int;
    private var _type:int;
    private var propertyValueItem:PropertyValueItem;

    public function ExpertItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new ExpertItemUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.list.itemRender = PropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
        ui.list.repeatX = 3;
        ui.list.repeatY = 2;
        ui.list.spaceX = 20;
        ui.list.spaceY = 10;

        if (!propertyValueItem) {
            propertyValueItem = new PropertyValueItem();
            ui.box.addChild(propertyValueItem);
        }
        propertyValueItem.updateInfo();
    }

    private function onRenderPropertyItem(cell:PropertyItem, index:int):void {

    }

    public function initInfo(signal:SignalDispatcher, index:int, type:int):void {
        this._index = index;
        this._type = type;
        ui.on(Event.CLICK, this, onClick, [signal]);
        ui.check.visible = false;
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch([_type]);
    }

    public function updateInfo():void {

    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        ui.off(Event.CLICK, this, onClick);

        if (ui.list.renderHandler)ui.list.renderHandler.clear();
        if (propertyValueItem) {
            propertyValueItem.destroy();
            propertyValueItem = null;
        }
    }
}
}
