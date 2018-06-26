/**
 * Created by dingcj on 2018/6/25.
 */
package com.game.module.company.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.ui.Box;

import ui.company.CompanySelectItemUI;

public class CompanySelectItem extends Box {
    private var ui:CompanySelectItemUI;
    private var index:int;

    public function CompanySelectItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new CompanySelectItemUI();
        this.addChild(ui);
    }

    public function initInfo(index:int, signal:SignalDispatcher):void {
        this.index = index;

        this.ui.on(Event.CLICK, this, onClick, [signal]);
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch(null);
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);

        this.ui.off(Event.CLICK, this, onClick);
    }
}
}
