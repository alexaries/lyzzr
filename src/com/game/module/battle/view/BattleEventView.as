/**
 * Created by dingcj on 2018/6/11.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleEventMediator;
import com.game.module.battle.view.items.BattleDialogItem;
import com.game.module.battle.view.items.BattleSelectionItem;
import com.game.module.battle.vo.BaseBattleEventVo;
import com.game.module.battle.vo.BattleDialogDataVo;
import com.game.module.battle.vo.BattleDialogVo;
import com.game.module.battle.vo.BattleExpertVo;
import com.game.module.copy.view.items.PropertyItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.BattleEventViewUI;

public class BattleEventView extends BaseView {
    private var ui:BattleEventViewUI;

    //info
    public var skipSignal:SignalDispatcher;
    public var moreSignal:SignalDispatcher;
    public var sureSignal:SignalDispatcher;

    public var itemSignal:SignalDispatcher;
    public var dialogSignal:SignalDispatcher;

    //result
    public var resultSureSignal:SignalDispatcher;

    public var vo:BaseBattleEventVo;

    public function BattleEventView(vo:BaseBattleEventVo) {
        super([]);
        this.vo = vo;

        skipSignal = new SignalDispatcher();
        moreSignal = new SignalDispatcher();
        sureSignal = new SignalDispatcher();
        itemSignal = new SignalDispatcher();
        dialogSignal = new SignalDispatcher();
        resultSureSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleEventMediator(this);
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
        ui = new BattleEventViewUI();
        addChild(ui);
        init();
    }

    private function init():void {
        if (vo.type == 1) {
            //对话事件
            var dialogVo:BattleDialogVo = vo as BattleDialogVo;
            dialogDisplay(dialogVo);
        }
        else if (vo.type == 2) {
            //专家事件
            var expertVo:BattleExpertVo = vo as BattleExpertVo;
            expertDisplay(expertVo);
        }

        //info
        ui.skipBtn.on(Event.CLICK, this, onClickSkipBtn, null);
        ui.moreBtn.on(Event.CLICK, this, onClickMoreBtn, null);

        //result
        ui.resultSureBtn.on(Event.CLICK, this, onClickResultSureBtn, null);
    }

    private function dialogDisplay(dialogVo:BattleDialogVo):void {
        updateState(1);

        ui.dialogList.itemRender = BattleDialogItem;
        ui.dialogList.renderHandler = Handler.create(this, onRenderDialogItem, null, false);

        var contentArr:Array = dialogVo.dialogEventContent.split('|');
        var ruleArr:Array = dialogVo.dialogEventRule.split('|');
        var feedBackArr:Array = dialogVo.dialogEventFeedback.split('|');

        var dataArr:Array = [];

        for (var i = 0; i < contentArr.length; i++) {
            var dataVo:BattleDialogDataVo = new BattleDialogDataVo();
            dataVo.content = contentArr[i];
            dataVo.rule = parseInt(ruleArr[i]);
            dataVo.feedBack = feedBackArr[i];
            dataArr.push(dataVo);
        }

        ui.dialogList.array = dataArr;
    }

    private function onRenderDialogItem(cell:BattleDialogItem, index:int):void {
        cell.initInfo(ui.dialogList.array[index], index, dialogSignal);
    }

    private function expertDisplay(expertVo:BattleExpertVo):void {
        updateState(2);

        ui.list.itemRender = PropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderItem, null, false);

        ui.playerList.hScrollBarSkin = "";
        ui.playerList.itemRender = BattleSelectionItem;
        ui.playerList.renderHandler = Handler.create(this, onRenderPlayerItem, null, false);
        ui.playerList.repeatX = 100;
        ui.playerList.repeatY = 1;
        itemSignal.getSignal(this).listen(onItemClick);

        var playerArr:Array = [];
        for (var i = 0; i < 20; i++) {
            playerArr.push("");
        }
        ui.playerList.array = playerArr;

        ui.sureBtn.on(Event.CLICK, this, onClickSureBtn, [expertVo]);//点击确定 出现专家事件的评分
    }

    private function onClickSureBtn(expertVo:BattleExpertVo):void {
        if (sureSignal)sureSignal.dispatch([expertVo]);
    }

    public function onItemClick(item:BattleSelectionItem, selectIndex:int) {
        ui.playerList.cells.forEach(function (cell:BattleSelectionItem) {
            cell.updateCheck(false);
        });
        item.updateCheck(true);
        updateInfo();
    }

    //选中新的角色后更新信息
    private function updateInfo() {

    }

    private function onRenderPlayerItem(cell:BattleSelectionItem, index:int):void {
        cell.initInfo(index, itemSignal);
    }

    private function onRenderItem(cell:PropertyItem, index:int):void {

    }

    private function onClickMoreBtn(e:Event):void {
        if (moreSignal)moreSignal.dispatch(null);
    }

    private function onClickSkipBtn(e:Event):void {
        if (skipSignal)skipSignal.dispatch(null);
    }

    private function onClickResultSureBtn(e:Event):void {
        if (resultSureSignal)resultSureSignal.dispatch(null);
    }

    public function updateState(state:int = 1):void {
        ui.eventResult.visible = state == 0;//反馈事件界面
        ui.dialogBox.visible = state == 1;//对话事件界面
        ui.eventInfo.visible = state == 2;//专家事件
    }

    public function updateEventResult(content:String):void {
        ui.resultContentLabel.text = content;
    }

    override public function dispose():void {
        super.dispose();
        ui.skipBtn.off(Event.CLICK, this, onClickSkipBtn, null);
        ui.moreBtn.off(Event.CLICK, this, onClickMoreBtn, null);
        ui.sureBtn.off(Event.CLICK, this, onClickSureBtn, null);
        ui.resultSureBtn.off(Event.CLICK, this, onClickResultSureBtn, null);
        if (ui.list.renderHandler)ui.list.renderHandler.clear();

        skipSignal.dispose();
        moreSignal.dispose();
        sureSignal.dispose();
        itemSignal.dispose();
        dialogSignal.dispose();
        resultSureSignal.dispose();
    }
}
}