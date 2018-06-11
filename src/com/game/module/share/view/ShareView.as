/**
 * Created by guanll on 2018/1/16.
 */
package com.game.module.share.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.gift.view.GoodsIcon;
import com.game.module.share.mediator.ShareMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.net.Loader;

import laya.utils.Handler;

import net.consts.AppConst;

import ui.share.ShareViewUI;

public class ShareView extends BaseWindow {
    public var ui:ShareViewUI;
    private var _status:int;//今日 0:未分享; 时间戳:已分享; UInt32(-1):已经领奖
    public var clickBtnSignal:SignalDispatcher;

    public function ShareView() {
        clickBtnSignal = new SignalDispatcher();
        super(["分享素材",{url:"module/share/bg1.png",type:Loader.IMAGE}]);
    }

    override public function dispose():void {
        clickBtnSignal.dispose();
        clickBtnSignal = null;
        ui.goodsList.renderHandler.clear();
        ui.goodsList.renderHandler = null;
        ui.goodsList.destroy(true);
        ui.btnClose.off(Event.CLICK,this,dispose);
        ui.btnPrize.off(Event.CLICK,this,btnPrizeClickHandler);
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new ShareMediator(this);
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
        ui = new ShareViewUI();
        addChild(ui);

        ui.goodsList.itemRender = GoodsIcon;
        ui.goodsList.renderHandler = Handler.create(this, goodsRenderHandler,null,false);
//        道具ID	道具数量
//        799	50
//        502	5
//        400	2
        var giftArr:Array = [];
        giftArr.push({itemid: 799, itemNum: 50});
        giftArr.push({itemid: 502, itemNum: 5});
        giftArr.push({itemid: 400, itemNum: 2});
        ui.goodsList.array = giftArr;

        ui.btnClose.on(Event.CLICK,this,dispose);
        ui.btnPrize.on(Event.CLICK,this,btnPrizeClickHandler);

        this.x = AppConst.padX;
    }

    private function btnPrizeClickHandler():void {
        clickBtnSignal.dispatch(null);
    }

    private function goodsRenderHandler(cell:GoodsIcon,index:int):void {
        cell.setData(ui.goodsList.array[index]);
        cell.visible = true;
    }

    public function get status():int {
        return _status;
    }

    public function set status(value:int):void {
        _status = value;

        ui.btnPrize.gray = false;
        if(_status == 0){
            ui.btnPrize.label = "分  享";
        }else if(_status == -1){
            ui.btnPrize.label = "已领取";
            ui.btnPrize.gray = true;
        }else{
            ui.btnPrize.label = "领取奖励";
        }
    }
}
}