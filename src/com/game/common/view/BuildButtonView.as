package com.game.common.view {
import com.game.vo.FuncOpenVO;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.main.icons.BuildButtonUI;

public class BuildButtonView extends Box {
    public var ui:BuildButtonUI;
    public var signal:SignalDispatcher;

    public var _vo:FuncOpenVO;
    public var isLocked:Boolean = false;  //是否锁住了
    private function gotoActivityHandler():void {
        if (isLocked) {
            return;
        }
        signal.dispatch([_vo]);
    }

    public function BuildButtonView() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BuildButtonUI();
        addChild(ui);

        this.ui.on(Event.CLICK, this, gotoActivityHandler);
    }

    override public function destroy(b:Boolean = true):void {
        super.destroy(b);
    }

    public function init(vo:FuncOpenVO, level:int, signal:SignalDispatcher):void {
        this._vo = vo;
        this.signal = signal;
        ui.close.visible = false;
        ui.nameLabel.text = vo.name;
    }

    public function update(level:int):void {
    }
}
}
