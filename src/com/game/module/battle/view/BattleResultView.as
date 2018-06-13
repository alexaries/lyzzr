/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleResultMediator;
import com.game.module.battle.view.items.BattleCommentItem;
import com.game.module.battle.view.items.BattleStarItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import net.data.sendCmd.rank.BattleCheckCmd;

import ui.battle.BattleResultViewUI;

public class BattleResultView extends BaseView {

    private var ui:BattleResultViewUI;

    public var finishSignal:SignalDispatcher;

    public function BattleResultView() {
        super([]);

        finishSignal = new SignalDispatcher();
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
        ui.rewardBox.on(Event.CLICK, this, onClickRewardBox);

        ui.starList.itemRender = BattleStarItem;
        ui.starList.renderHandler = Handler.create(this, onRenderStarItem, null, false);

        ui.commentList.itemRender = BattleCommentItem;
        ui.commentList.renderHandler = Handler.create(this, onRenderCommentItem, null, false);

        updateComment();
        updateStar(2);
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

    private function onClickRewardBox(e:Event):void {
        if (finishSignal)finishSignal.dispatch(null);
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
        ui.rewardBox.off(Event.CLICK, this, onClickRewardBox);

        if (finishSignal)finishSignal.dispose();
        if (ui.commentList.renderHandler)ui.commentList.renderHandler.clear();
    }
}
}