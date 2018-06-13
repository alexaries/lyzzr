/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.battle.BattlePlayerSelectItemUI;

public class BattlePlayerSelectItem extends Box {

    private var ui:BattlePlayerSelectItemUI;
    public var index:int;

    public function BattlePlayerSelectItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BattlePlayerSelectItemUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        updateCheck(false);
    }

    public function updateCheck(isCheck:Boolean):void {
        ui.check.visible = isCheck;
    }

    public function initInfo(signal:SignalDispatcher, index:int):void {
        this.index = index;
        this.ui.on(Event.CLICK, this, onClick, [signal]);
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch(this);
    }

    public function updateInfo():void {

    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        this.ui.off(Event.CLICK, this, onClick);
    }
}
}
