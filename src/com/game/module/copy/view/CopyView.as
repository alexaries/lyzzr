/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.view {
import com.component.MemoryManager;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.common.view.BaseWindow;
import com.game.module.copy.mediator.CopyMediator;
import com.game.module.copy.view.items.ComboBoxItem;
import com.game.module.copy.view.items.CopyItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.List;
import laya.utils.Handler;

import ui.copy.CopyViewUI;

public class CopyView extends BaseFrame {

    private var ui:CopyViewUI;
    public var closeSignal:SignalDispatcher;
    public var itemSignal:SignalDispatcher;

    public function CopyView() {
        super();

        closeSignal = new SignalDispatcher();
        itemSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CopyMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new CopyViewUI();
        addChild(ui);
        init();
        adapt();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);

        ui.combox.selectedIndex = 0;
        ui.combox.selectHandler = Handler.create(this, onComboxChange, null, false);
        ui.combox.itemSize = 55;
        ui.combox.itemRender = ComboBoxItem;
        var comList:List = new List();
        comList.itemRender = ComboBoxItem;
        ui.combox.list = comList;

        ui.list.itemRender = CopyItem;
        ui.list.renderHandler = Handler.create(this, onRenderCopyItem, null, false);

        initInfo();
        refreshArr();
    }

    private function onRenderCopyItem(cell:CopyItem, index:int):void {
        cell.updateInfo(index, itemSignal);
    }

    private function loadBg():void {
        var url:String = "ui/bg/back_investigate_1.png/back_investigate_1.png";
        MemoryManager.getBundle(MemoryManager.IMAGE).addLabel(ui.bg.skin);
        MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel(ui.bg.skin);

        ui.bg.skin = "";
        ui.bg.skin = url;
    }

    private function onComboxChange():void {
        updateInfo();
    }

    private function initInfo():void {

    }

    public function updateInfo():void {
        var index:int = ui.combox.selectedIndex;
        loadBg();
        refreshArr();
    }

    private function refreshArr():void {
        var arr:Array = [];

        for (var i = 0; i < 18; i++) {
            arr.push("i:" + i);
        }

        ui.list.array = arr;

        ui.list.spaceX = 160;
        ui.list.spaceY = 380;
    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        closeSignal.dispose();
        itemSignal.dispose();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        if (ui.combox.selectHandler) ui.combox.selectHandler.clear();
        if (ui.list.renderHandler)ui.list.renderHandler.clear();
    }
}
}