/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view.items {
import com.game.module.battle.vo.BattleDialogDataVo;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.battle.BattleDialogItemUI;

public class BattleDialogItem extends Box {

    private var ui:BattleDialogItemUI;
    private var index:int;
    private var dataVo:BattleDialogDataVo;

    public function BattleDialogItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BattleDialogItemUI();
        this.addChild(ui);
    }

    public function initInfo(dataVo:BattleDialogDataVo, index:int, signal:SignalDispatcher):void {
        this.index = index;
        this.dataVo = dataVo;
        ui.btn.on(Event.CLICK, this, onClickBtn, [signal]);
        ui.btn.label = dataVo.content;
    }

    private function onClickBtn(signal:SignalDispatcher):void {
        if (signal)signal.dispatch(this);
    }

    public function get getIndex():int {
        return index;
    }

    public function get getDataVo():BattleDialogDataVo {
        return dataVo;
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        ui.btn.off(Event.CLICK, this, onClickBtn);
    }
}
}
