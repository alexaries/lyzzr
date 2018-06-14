/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.battle.BattleDialogItemUI;

public class BattleDialogItem extends Box {

    private var ui:BattleDialogItemUI;
    private var index:int;

    public function BattleDialogItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BattleDialogItemUI();
        this.addChild(ui);
    }

    public function initInfo(index:int, signal:SignalDispatcher):void {
        this.index = index;
        ui.btn.on(Event.CLICK, this, onClickBtn, [signal]);
    }

    private function onClickBtn(signal:SignalDispatcher):void {
        if (signal)signal.dispatch(null);
    }

    public function updateInfo(str:String):void {
        ui.btn.label = str;
    }

    public function get getIndex():int {
        return index;
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        ui.btn.off(Event.CLICK, this, onClickBtn);
    }
}
}
