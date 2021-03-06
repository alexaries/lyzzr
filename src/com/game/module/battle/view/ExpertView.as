/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.consts.BaseLayer;
import com.game.module.battle.mediator.ExpertMediator;
import com.game.module.battle.view.items.ExpertItem;
import com.game.module.copy.view.items.PropertyValueItem;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;
import laya.utils.Handler;

import ui.battle.ExpertViewUI;

public class ExpertView extends BaseFrame {
    private var ui:ExpertViewUI;

    public var closeSignal:SignalDispatcher;
    public var itemSignal:SignalDispatcher;

    private var itemHeight:int = 370;
    private var itemSpace = 20;
    private var interval:int = 40;//own与other中间的间距

    private var ownCount = 0;
    private var otherCount = 0;

    private var infoView:ExpertInfoView;
    private var selectionView:ExpertSelectionView;

    private var isInBattle:Boolean = false;

    public function ExpertView() {
        super([]);
        layer = BaseLayer.POP_FRAME;

        closeSignal = new SignalDispatcher();
        itemSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new ExpertMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    public function get data():Boolean {
        return _data as Boolean;
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui = new ExpertViewUI();
        this.addChild(ui);

        init();
        adapt();
    }

    private function adapt():void {
        setContent(ui);
    }

    private function init():void {
        ui.panel.vScrollBarSkin = "";

        ui.ownList.itemRender = ExpertItem;
        ui.ownList.renderHandler = Handler.create(this, onRenderOwnItem, null, false);
        ui.ownList.repeatX = 2;
        ui.ownList.spaceX = 20;
        ui.ownList.spaceY = 20;

        ui.otherList.itemRender = ExpertItem;
        ui.otherList.renderHandler = Handler.create(this, onRenderOtherItem, null, false);
        ui.otherList.repeatX = 2;
        ui.otherList.spaceX = 20;
        ui.otherList.spaceY = 20;

        ui.propertyList.itemRender = PropertyValueItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
        ui.propertyList.repeatX = 4;
        ui.propertyList.repeatY = 1;

        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
        ui.selectBtn.on(Event.CLICK, this, onClickSelectBtn);

        updateOwnList();
        updateOtherList();

        ui.selectBtn.visible = true;
        ui.cancelSelectBtn.visible = false;

        itemSignal.getSignal(this).listen(onItemClick);
    }

    public function initInfo(isInBattle:Boolean):void {
        this.isInBattle = isInBattle;
    }

    private function onItemClick(type:int):void {
        addInfoView(type);
    }

    private function onRenderPropertyItem(cell:PropertyValueItem, index:int):void {

    }

    private function onRenderOwnItem(cell:ExpertItem, index:int):void {
        cell.initInfo(itemSignal, index, 0);
    }

    private function onRenderOtherItem(cell:ExpertItem, index:int):void {
        cell.initInfo(itemSignal, index, 1);
    }

    private function updateOwnList():void {
        ownCount = 9;
        var line:int = Math.round(ownCount / 2);
        var ownHeight:int = itemHeight * line + itemSpace * (line - 1) + ui.ownTitleBox.height + interval;
        ui.ownList.height = ownHeight;

        ui.otherBox.pos(0, ownHeight);
        var arr:Array = [];
        for (var i = 0; i < ownCount; i++) {
            arr.push("");
        }
        ui.ownList.array = arr;
    }

    private function updateOtherList():void {
        otherCount = 10;
        var line:int = Math.round(otherCount / 2);
        var otherHeight = itemHeight * line + itemSpace * (line - 1) + ui.otherTitleBox.height;
        ui.otherList.height = otherHeight;

        var arr:Array = [];
        for (var i = 0; i < otherCount; i++) {
            arr.push("");
        }
        ui.otherList.array = arr;
    }

    public function addInfoView(type:int):void {
        if (!infoView) {
            infoView = new ExpertInfoView();
            addChildView(infoView);
            infoView.refresh(type, isInBattle);
        }
        else {
            infoView.refresh(type, isInBattle);
            infoView.show();
        }
    }

    public function addSelectionView():void {
        if (!selectionView) selectionView = new ExpertSelectionView();
        addChildView(selectionView);
        selectionView.show();
    }

    private function addChildView(view:Sprite):void {
        if (view && !ui.container.contains(view)) {
            ui.container.addChild(view);
        }
    }

    private function onClickSelectBtn():void {
        addSelectionView();
    }

    private function onClickCloseBtn():void {
        if (closeSignal)closeSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();

        if (infoView) {
            infoView.tryDispose();
            infoView = null;
        }

        if (selectionView) {
            selectionView.tryDispose();
            selectionView = null;
        }

        if (ui.ownList.renderHandler)ui.ownList.renderHandler.clear();
        if (ui.otherList.renderHandler)ui.otherList.renderHandler.clear();

        if (closeSignal)closeSignal.dispose();
        if (itemSignal)itemSignal.dispose();
    }
}
}