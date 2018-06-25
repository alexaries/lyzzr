/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.view.items {
import com.signal.SignalDispatcher;

import config.stage.IstageCfg;

import laya.events.Event;
import laya.ui.Box;

import ui.copy.CopyItemUI;

public class CopyItem extends Box {
    private var ui:CopyItemUI;
    private var signal:SignalDispatcher;
    private var cfg:IstageCfg;

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
        if (signal)signal.dispatch([cfg]);
    }

    public function initInfo(index:int, signal:SignalDispatcher, data:Object):void {
        this.signal = signal;

//        var x:int = data.x;
//        var y:int = data.y;
//        this.ui.pos(x, y);

        cfg = data.cfg;
        ui.nameLabel.text = cfg.stageSign;
    }

    override public function destroy(destroyChild:Boolean = true):void {
        ui.off(Event.CLICK, this, onClick);
        super.destroy(destroyChild);
    }
}
}
