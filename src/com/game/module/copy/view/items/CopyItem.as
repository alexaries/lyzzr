/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.copy.CopyItemUI;

public class CopyItem extends Box {
    private var ui:CopyItemUI;
    private var signal:SignalDispatcher;

    public function CopyItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new CopyItemUI();
        this.addChild(ui);

        ui.on(Event.CLICK, this, onClick);
    }

    private function onClick(e:Event):void {
        if (signal)signal.dispatch(null);
    }

    public function updateInfo(index:int, signal:SignalDispatcher):void {
        this.signal = signal;

//        var x:int = Math.round(Math.random() * 800);
//        var y:int = Math.round(Math.random() * 1200);
//
//        this.ui.pos(x, y);
        ui.nameLabel.text = (index + 1) + "-" + (index + 1);
    }

    override public function destroy(destroyChild:Boolean = true):void {
        ui.off(Event.CLICK, this, onClick);
        super.destroy(destroyChild);
    }
}
}
