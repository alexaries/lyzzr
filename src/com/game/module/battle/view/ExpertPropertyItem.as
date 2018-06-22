/**
 * Created by dingcj on 2018/6/22.
 */
package com.game.module.battle.view {
import com.game.module.copy.view.items.PropertyItem;
import com.signal.SignalDispatcher;

import laya.events.Event;

public class ExpertPropertyItem extends PropertyItem {

    private var id:int;

    public function ExpertPropertyItem() {
        super();
    }

    public function initInfo(signal:SignalDispatcher, id:int):void {
        this.id = id;
        this.ui.on(Event.CLICK, this, onClick, [signal]);
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch([id]);
    }

    override public function updateInfo():void {

    }

    public function get Id():int {
        return id;
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        this.ui.off(Event.CLICK, this, onClick);
    }
}
}
