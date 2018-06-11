package com.game.common.view {
import com.game.common.mediator.ActivityIconListMediator;
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import laya.display.Sprite;

import laya.events.Event;
import laya.ui.List;

import laya.utils.Handler;

import net.consts.AppConst;

import com.game.common.mvc.BaseMediator;

import ui.main.icons.ActivityIconListUI;

public class ActivityIconListView extends BaseView {
    public var ui:ActivityIconListUI;
    public var gotoActivitySignal:SignalDispatcher;
    public var pageChangeSignal:SignalDispatcher;
    public var userLevel:int;

    private var index:int = 0;

    private var datas:Array;

    public function ActivityIconListView() {
        gotoActivitySignal = new SignalDispatcher();
        pageChangeSignal = new SignalDispatcher();
        super();
    }

    override public function getMediator():BaseMediator {
        return new ActivityIconListMediator(this);
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
        ui = new ActivityIconListUI();
        addChild(ui);

        ui.bg.height = AppConst.fullScreenWidth;//这个背景条是90度旋转过的 所以取height
        ui.icons.width = AppConst.fullScreenWidth;
        ui.width = AppConst.fullScreenWidth;
        this.width = AppConst.fullScreenWidth;

        ui.turnBtn.on(Event.CLICK, this, onClickBtn);
        ui.turnBtn.x = AppConst.fullScreenWidth - ui.turnBtn.width - 5;

        ui.icons.array = [];
        ui.icons.itemRender = BaseIconView;
        ui.icons.renderHandler = Handler.create(this, renderIconHandler, null, false);
    }

    private function onClickBtn(e:Event):void {
        if (e.target == ui.turnBtn) {
            index = index == 0 ? 1 : 0;
            pageChangeHandler();
        }
    }

    private function renderIconHandler(cell:BaseIconView, index:int):void {
        cell.init(ui.icons.array[index], index, gotoActivitySignal);
    }

    public function resetView(arr:Array) {
        datas = arr;
        if (datas.length <= 7) {
            ui.turnBtn.visible = false;
        } else {
            ui.turnBtn.visible = true;
        }
        pageChangeHandler();
    }

    private function pageChangeHandler():void {
        var start:int = 0;
        var end:int = 0;
        if (index == 0) {
            start = 0;
            if (datas.length > 7) {
                end = 7;
            } else {
                end = datas.length;
            }
            ui.turnBtn.skewY = 180;
        } else {
            if (datas.length > 7) {
                start = 7;
                ui.turnBtn.skewY = 0;
            } else {
                start = 0;
                ui.turnBtn.skewY = 180;
            }

            end = datas.length;
        }
        ui.icons.array = datas.slice(start, end);
        pageChangeSignal.dispatch([]);
    }

    public function addIcon(vo:ActivityVO):void {
        if (!ui || !ui.icons) {
            return;
        }
        ui.icons.addItem(vo);
    }

    public function removeIcon(vo:ActivityVO):void {
        if (!vo || !ui.icons.array || ui.icons.array.length == 0) {
            return;
        }
        var i:int;
        var datas:Array = ui.icons.array;
        var len:int = datas.length;
        for (i = 0; i < len; i++) {
            if (datas[i].name == vo.name) {
                ui.icons.deleteItem(i);
                break;
            }
        }
    }

    public function getIconList():List {
        return ui.icons;
    }

    override public function dispose():void {
        ui.icons.renderHandler.clear();
        ui.icons.renderHandler = null;
        gotoActivitySignal.dispose();
        gotoActivitySignal = null;
        super.dispose();
    }
}
}