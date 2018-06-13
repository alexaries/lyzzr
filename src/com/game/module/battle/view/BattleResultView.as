/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleResultMediator;
import com.game.module.battle.view.items.BattleCommentItem;
import com.game.module.battle.view.items.BattleStarItem;
import com.game.module.pack.view.ItemCell;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.BattleResultViewUI;

public class BattleResultView extends BaseView {
    private var ui:BattleResultViewUI;
    public var finishSignal:SignalDispatcher;
    public var moreSignal:SignalDispatcher;

    public function BattleResultView() {
        super([]);

        finishSignal = new SignalDispatcher();
        moreSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleResultMediator(this);
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
        ui = new BattleResultViewUI();
        addChild(ui);

        init();
    }

    private function init():void {
        updateState();

        ui.fabuBtn.on(Event.CLICK, this, onClickFaBuBtn);
        ui.commentBox.on(Event.CLICK, this, onClickCommentBox);
        ui.moreBtn.on(Event.CLICK, this, onClickMoreBtn);
        ui.finishBtn.on(Event.CLICK, this, onClickFinishBtn);

        ui.starList.itemRender = BattleStarItem;
        ui.starList.renderHandler = Handler.create(this, onRenderStarItem, null, false);

        ui.commentList.itemRender = BattleCommentItem;
        ui.commentList.renderHandler = Handler.create(this, onRenderCommentItem, null, false);

        updateComment();
        updateStar(2);

        ui.rewardList.hScrollBarSkin = "";
        ui.rewardList.itemRender = ItemCell;
        ui.rewardList.renderHandler = Handler.create(this, onRenderRewardItem, null, false);
    }

    private function onClickFinishBtn(e:Event):void {
        if (finishSignal)finishSignal.dispatch(null);
    }

    private function onClickMoreBtn(e:Event):void {
        if (moreSignal)moreSignal.dispatch(null);
    }

    private function onRenderRewardItem(cell:ItemCell, index:int):void {
//        cell.showTip = true;
    }

    private function updateStar(num:int):void {
        var arr:Array = [];
        for (var i = 0; i < 3; i++) {
            arr.push(i < num);
        }
        ui.starList.array = arr;
    }

    private function onRenderStarItem(cell:BattleStarItem, index:int):void {
        cell.updateInfo(ui.starList.array[index]);
    }

    private function updateComment():void {
        var arr:Array = [];
        for (var i = 0; i < 4; i++) {
            arr.push("");
        }
        ui.commentList.array = arr;
    }

    private function onRenderCommentItem(cell:BattleCommentItem, index:int):void {

    }

    private function onClickCommentBox(e:Event):void {
        updateState(2);
    }

    private function onClickFaBuBtn(e:Event):void {
        updateState(1);
    }

    private function updateState(state:int = 0):void {
        ui.first.visible = state == 0;
        ui.info.visible = state == 1 || state == 2;
        ui.commentBox.visible = state == 1;
        ui.rewardBox.visible = state == 2;
    }

    override public function dispose():void {
        super.dispose();

        ui.fabuBtn.off(Event.CLICK, this, onClickFaBuBtn);
        ui.commentBox.off(Event.CLICK, this, onClickCommentBox);
        ui.moreBtn.off(Event.CLICK, this, onClickMoreBtn);
        ui.finishBtn.off(Event.CLICK, this, onClickFinishBtn);

        if (finishSignal)finishSignal.dispose();
        if (moreSignal)moreSignal.dispose();
        if (ui.starList.renderHandler)ui.starList.renderHandler.clear();
        if (ui.commentList.renderHandler)ui.commentList.renderHandler.clear();
        if (ui.rewardList.renderHandler)ui.rewardList.renderHandler.clear();
    }
}
}