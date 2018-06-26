/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.company.view.items {
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.ui.Box;

import ui.company.CompanyCourseItemUI;

public class CompanyCourseItem extends Box {

    private var ui:CompanyCourseItemUI;

    private var _id:int = 0;

    public function CompanyCourseItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new CompanyCourseItemUI();
        this.addChild(ui);

        reset();
    }

    public function initInfo(signal:SignalDispatcher, point:Object):void {
        this.ui.pos(point.x, point.y);

        this.ui.on(Event.CLICK, this, onClick, [signal]);
    }

    private function onClick(signal:SignalDispatcher):void {
        if (_id == 0)return;
        if (signal)signal.dispatch([_id]);
        reset();
    }

    public function updateInfo(id:int):void {
        this._id = id;

        ui.bg.visible = false;
        ui.info.visible = true;
    }

    private function reset():void {
        _id = 0;
        ui.bg.visible = true;
        ui.info.visible = false;
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);

    }
}
}
