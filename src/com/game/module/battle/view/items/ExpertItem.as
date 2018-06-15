/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.battle.ExpertItemUI;

public class ExpertItem extends Box {

    private var ui:ExpertItemUI;
    private var _index:int;
    private var _type:int;

    public function ExpertItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new ExpertItemUI();
        this.addChild(ui);
    }

    public function initInfo(signal:SignalDispatcher, index:int, type:int):void {
        this._index = index;
        this._type = type;
        ui.on(Event.CLICK, this, onClick, [signal]);
        ui.check.visible = false;
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch(_type);
    }

    public function updateInfo():void {

    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        ui.off(Event.CLICK, this, onClick);
    }
}
}
