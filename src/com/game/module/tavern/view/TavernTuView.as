/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.consts.BaseLayer;
import com.game.module.tavern.mediator.TavernTuMediator;
import com.game.module.tavern.view.items.TavernTuItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.tavern.TavernTuViewUI;

public class TavernTuView extends BaseWindow {

    private var ui:TavernTuViewUI;
    public var closeSignal:SignalDispatcher;

    public function TavernTuView() {
        super();
        closeSignal = new SignalDispatcher();
        layer = BaseLayer.FRAME;
    }

    override public function getMediator():BaseMediator {
        return new TavernTuMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();

    }

    private function __onComplete():void {
        ui = new TavernTuViewUI();
        addChild(ui);
        adapt();
        init();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);

        ui.list.itemRender = TavernTuItem;

        var arr:Array = [];
        for (var i = 0; i < 21; i++) {
            arr.push("");
        }

        ui.list.array = arr;
        ui.list.renderHandler = Handler.create(this, onRenderItem, null, false);

        ui.list.spaceX = 40;
        ui.list.spaceY = 10;

        ui.tab.selectHandler = Handler.create(this, onSelectHandler, null, false);
    }

    private function onSelectHandler(index:int):void {
        trace("你选择了:" + index + "个选项");
    }

    private function onRenderItem(cell:TavernTuItem, index:int):void {

    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        if (ui.tab.selectHandler) ui.tab.selectHandler.clear();
        ui.tab.selectHandler = null;
        closeSignal.dispose();
    }
}
}