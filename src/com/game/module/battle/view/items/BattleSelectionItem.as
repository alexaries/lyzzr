/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.battle.BattleSelectionItemUI;

public class BattleSelectionItem extends Box {
    private var ui:BattleSelectionItemUI;
    private var isChecked:Boolean = false;
    private var isMaking:Boolean = false;
    private var index:int;

    public function BattleSelectionItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BattleSelectionItemUI();
        this.addChild(ui);
    }

    public function initInfo(index:int, signal:SignalDispatcher):void {
        isChecked = false;
        isMaking = false;
        ui.check.visible = false;
        ui.making.visible = false;
        this.index = index;
        this.ui.on(Event.CLICK, this, onClick, [signal]);
    }

    private function onClick(signal:SignalDispatcher):void {
        if (isMaking)return;
        if (isChecked)return;
        if (signal)signal.dispatch([this, this.index]);
    }

    public function updateInfo():void {
        trace("测试");
    }

    public function updateCheck(isCheck:Boolean):void {
        isChecked = isCheck;
        ui.check.visible = isCheck;
        ui.posBox.pos(0, 0);
        if (isCheck)ui.posBox.pos(0, -30);
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        this.ui.off(Event.CLICK, this, onClick);
    }
}
}
