/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleFetterMediator;
import com.game.module.copy.view.items.PropertyItem;
import com.game.module.copy.view.items.PropertyValueItem;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.BattleFetterViewUI;

public class BattleFetterView extends BaseView {

    private var ui:BattleFetterViewUI;

    public function BattleFetterView() {
        super([]);
    }

    override public function getMediator():BaseMediator {
        return new BattleFetterMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        ui = new BattleFetterViewUI();
        addChild(ui);

        init();
    }

    private function init():void {
        updateState(0);

        //pre
        ui.prefetterBtn.on(Event.CLICK, this, onPrefetterClick);

        //info
        ui.lastBtn.on(Event.CLICK, this, onLastClick);

        ui.needList.itemRender = PropertyItem;
        ui.needList.renderHandler = Handler.create(this, onRenderNeedItem, null, false);

        ui.propertyList.itemRender = PropertyValueItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
        ui.propertyList.repeatX = 2;
        ui.propertyList.spaceX = 60;
        ui.propertyList.spaceY = 20;

        
    }

    private function onRenderPropertyItem(cell:PropertyValueItem, index:int):void {

    }

    private function onRenderNeedItem(cell:PropertyItem, index:int):void {

    }

    private function onLastClick(e:Event):void {

    }

    private function onPrefetterClick(e:Event):void {
        updateState(1);
    }

    public function updateState(state:int = 0):void {
        ui.pre.visible = state == 0;
        ui.info.visible = state == 1;
    }

    override public function dispose():void {
        super.dispose();
        ui.prefetterBtn.off(Event.CLICK, this, onPrefetterClick);
        ui.lastBtn.off(Event.CLICK, this, onLastClick);
    }
}
}